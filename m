Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CC7293479
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 07:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730606AbgJTF5W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 01:57:22 -0400
Received: from mail.intenta.de ([178.249.25.132]:41116 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730544AbgJTF5W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 01:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=DxkOG6tcL5gcKVIp0/e9Zt2RcQOYn4aTzs2TtB6IKY4=;
        b=u4u6lCgEclOBj535R4RCX01d1BQS9zVS90ykRgZGIlVmZ9CZ64R2s5eQ/MqpTISj+NNUhKyTZK5VC9aGDQ/DxK0ooDW1a2QpA+fUZwqD5ZlHpqRr02wf+uhlNUMZk5jNKZCqvLn/IZEKhxAtSj6Nkj3jZpZo0lxZjedPyFcew88Ns3H6gRbpJbVY2tdu6fumz5L3Fx/tAltOGjUOQAqmPR7sQg2dtdQufOtoNgf0A1Ht+hh8cYcGXNJcJ8ZxGuU7Hus8ai/1ow8nKRsVCkc7xqMv2EVnlEcICglEIxKc5zNvhCX/SMRwfogzwPumJHzPMfcbDYP8MP1aXQ6ApcVNoA==;
Date:   Tue, 20 Oct 2020 07:57:14 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent
 chip reference to a weak_ptr
Message-ID: <20201020055714.GA10256@laureti-dev>
References: <20201016090949.24456-1-brgl@bgdev.pl>
 <20201016102937.GA22245@laureti-dev>
 <CAMRc=Md1RxGiv+v27dZOSsGX4v1OEc=E-EJvd-4_8tMjgFicoA@mail.gmail.com>
 <CAMRc=MfjBai0PECzvXjLN9w_sP-ZE4QBxGL0-puow2zDKJd+Uw@mail.gmail.com>
 <20201019123801.GA5116@laureti-dev>
 <CAMpxmJU0y5Zze3we-NjnLi1fCG69v38fMwvTgCe0JXGK+RxLNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMpxmJU0y5Zze3we-NjnLi1fCG69v38fMwvTgCe0JXGK+RxLNQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 03:06:18PM +0200, Bartosz Golaszewski wrote:
> But this still forces us to do
> 
>     return chip(::std::shared_ptr<::gpiod_chip>(this->_m_owner));
> 
> instead of a much more elegant
> 
>     return chip(this->_m_owner);
> 
> in line.cpp and there's an even less elegant thing in iter.cpp. Or am
> I missing something?

I confirm the behaviour you see. My intuition that the conversion would
happen implicitly was wrong.

Still the sticking point is this: Your constructor should allow for most
flexibility to the caller and in this case that means it should consume
a shared_ptr by value.

In order to make the case with a weak_ptr bearable, I suggest adding a
delegating constructor:

    chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr) :
        chip(::std::shared_ptr<::gpiod_chip>(chip_ptr)) {}

That way your desired way of calling should continue to work while not
forcing callers to convert a real shared_ptr to weak_ptr and back.

Sorry for the confusion about this.

Helmut
