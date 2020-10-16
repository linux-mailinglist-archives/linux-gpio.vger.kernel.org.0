Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096772902C3
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 12:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394763AbgJPK3x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 06:29:53 -0400
Received: from mail.intenta.de ([178.249.25.132]:34236 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389536AbgJPK3w (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Oct 2020 06:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=cVdF7U/w1hmKOK9s9WyzS88kXS6EOfUI6VvQsaWiD4s=;
        b=OHwhyjJpo8TeQ4EPsgozPEPLxuk3eQIgwqhzlexgiofzg0xGfHQIDLC3awdPjd5ogGq8Fc13PbcXXfl+hg/D0kvqyIh262BVAGX30QONeCKuLEv4jy+kBGaLhPaHpNc047teok9lxEwcENCjVWNeqS8lnjlECNio/+rXl7wP31g/MNS9azV4HQfQK1tWiGOfkew7wOihEtH3igcg57HB4QyyuBoZCGRJD3HrOLTOh6XYvsDnZ3ZVAukZqldyFadx3DfqSBGSqmxy43PjvavsQdkLcUlB8qKQh39ERrErg/eSg22i4q4qgjaoEN9wTH5yzoFmtSqSSUBozvK8oHoDxg==;
Date:   Fri, 16 Oct 2020 12:29:39 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent
 chip reference to a weak_ptr
Message-ID: <20201016102937.GA22245@laureti-dev>
References: <20201016090949.24456-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201016090949.24456-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 11:09:49AM +0200, Bartosz Golaszewski wrote:
> Demote the parent reference to a weak_ptr. Introduce a sub-class that
> allows line and line_bulk objects to lock the chip by temporarily
> converting this weak_ptr to a full shared_ptr - this way we don't risk
> dropping the last reference to the parent chip when the line is calling
> the underlying library functions. Chip deleted during that time will
> expire right after the concerned line method returns.

I don't think I understand the implications for this yet. Something in
my mental model must be wrong or the change doesn't make much sense.

> +chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
> +	: _m_chip(chip_ptr)
> +{
> +
> +}
> +

I think what happens here is that you upgrade a weak_ptr to a
shared_ptr. Wouldn't it be more natural to request a

    ::std::shared_ptr<::gpiod_chip> &&

here and thus make the ownership-taking more explicit? It would be done
on the caller-side and thus be more transparent. Stuffing weak_ptrs
should continue to work.

> @@ -526,7 +528,22 @@ private:
>  	line_event make_line_event(const ::gpiod_line_event& event) const noexcept;
>  
>  	::gpiod_line* _m_line;
> -	chip _m_chip;
> +	::std::weak_ptr<::gpiod_chip> _m_owner;
> +
> +	class chip_locker
> +	{
> +	public:
> +		chip_locker(const line& line);
> +		~chip_locker(void) = default;
> +
> +		chip_locker(const chip_locker& other) = delete;
> +		chip_locker(chip_locker&& other) = delete;
> +		chip_locker& operator=(const chip_locker&& other) = delete;
> +		chip_locker& operator=(chip_locker&& other) = delete;
> +
> +	private:
> +		::std::shared_ptr<::gpiod_chip> _m_chip;
> +	};
>  
>  	friend chip;
>  	friend line_bulk;

I don't quite get what problem this chip_lcoker solves. It seems to
prevent concurrent destruction of a ::gpiod_chip. How can this happen?
One option would be concurrency due to threads. However the whole API
does not look thread-safe so this would be wrong. The other could be
callbacks. I couldn't find any callbacks in the C++ bindings. So now I
am confused why one would need to lock the chip. Do you fear changes
inside signal handlers?

> @@ -536,9 +553,11 @@ private:
>  /**
>   * @brief Find a GPIO line by name. Search all GPIO chips present on the system.
>   * @param name Name of the line.
> - * @return Returns a line object - empty if the line was not found.
> + * @return Returns a <line, chip> pair where line is the line with given name
> + *         and chip is the line's owner. Both objects are empty if the line was
> + *         not found.
>   */
> -GPIOD_API line find_line(const ::std::string& name);
> +GPIOD_API ::std::pair<line, chip> find_line(const ::std::string& name);

This makes the API a little less convenient to use.

> @@ -39,6 +39,7 @@ line::line(::gpiod_line* line, const chip& owner)
>  unsigned int line::offset(void) const
>  {
>  	this->throw_if_null();
> +	line::chip_locker lock_chip(*this);
>  
>  	return ::gpiod_line_offset(this->_m_line);
>  }

This example nicely shows why I am confused about the chip_locker. Why
can the chip not become null between the throw_if_null call and the
chip_locker construction, but it can be externally mutated between the
chip_locker construction and the gpiod_line_offset call? It would appear
to me that the chip_locker is entirely unnecessary here.

I also think that this refactoring still does not accurately represent
the kernel interfaces. When you dispose a chip, the owned line becomes
invalidated. Why do I have to keep the chip to use the line? Is it
really reasonable to have chips own lines?

When I use the bare kernel interfaces, I can open a chip, request a line
(which receives a separate fd) and then I can close the chip and
continue working with the line fd. I could even open the chip in one
process and transfer the open line fd to a different (possibly
sandboxed) process or close the chip and sandbox the process prohibiting
further VFS operations. As far as I can see, neither the old nor the
proposed API handles any of this.

Helmut
