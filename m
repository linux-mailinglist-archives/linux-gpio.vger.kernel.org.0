Return-Path: <linux-gpio+bounces-6314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C8B8C2E59
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2024 03:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A771FB215AB
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2024 01:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFCBCA4E;
	Sat, 11 May 2024 01:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFURaj+X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF12F5E
	for <linux-gpio@vger.kernel.org>; Sat, 11 May 2024 01:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715389911; cv=none; b=VY+ZZ9qUio6/jsZuZCfD0w9mgXyZqdvl8LG73NoKFlASu0ie2xRtdvShx4Ov7wtYN60Md/l89nEECGchoTubS4uN0Lxbt9JKxXiir6kEv/OGP2qtHcIf1t1PhWvf2j4kZsOpMs3QVWOe2Gs9tikT1wbfgZIgvkchf3LPQUO3GiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715389911; c=relaxed/simple;
	bh=sl7pPcj8y0VD7xmKgYTCx24GWNlMz5V1+hzbi50cfDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcP+eG7tpFHBCD5Mr+V5fOrv49u+ygaHUjBbP41p7gasOic7Dx1rmzS/wZNCh6lnV+xkAfSH1EGHCDQ5otyUM41o3KtWx31kbw1G8w4d1LF8sosumG8hyIrIJfLWkrhcyUbODUSVfg18H0o5Brcbmv+2OH95xe4mb9vYB6Vyb48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFURaj+X; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-60585faa69fso1786049a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715389909; x=1715994709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puYjU1z8K2EgxWmQQxdELrKFYdGcYZAKmVu3KI3EQAw=;
        b=MFURaj+Xj8hE0c4E64BQrHqlN33qyMwiyFK5wD+lJrs+11eio4QeM/UW8uHpoBRgWF
         flTiKGVzwYDsank8T3zt/hyd+t/jB8GNpX8tdJxnCqsEuW+E7vF+b03JwsrdM5V5JDfm
         1BZcVPKpHI3wGRpzKzbrVtBN+0sk1HCAVeWYgNhSqz9RxutCA6gD1FNAaIWoXKaM+lo7
         0z+Dg4lCMivkJ1SVkLujK16QCm1rEnBNQW1MpVt37QtiGSvioSQ1yNh9UP2tq+BneYko
         mAU+xgI7R1W8dz6rF2Iku8ebUX16xTIHWTqstUOEbuD2CpujjWNZGaldS5EiCcN04Aaw
         7eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715389909; x=1715994709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puYjU1z8K2EgxWmQQxdELrKFYdGcYZAKmVu3KI3EQAw=;
        b=biTD1yIGFO3yNgPmgAONJvO/jBKbVHAm3NZlBZQW3CVVEQyWVAKhQOr8OavTRkTPCC
         ZO0Sx6cl24EI/2chRddKH9p6VWLkQJqTBRgM+D+YCGMOU91CZbX7/MUVOMBL+53ktFeQ
         cqD5rnm30MYGxLG/HPADfAr0modblXG71Zd4ZwbmNkygxQNzkiryoF942R99Gl8H4uQl
         WtetU45P6FXgVXZseFTYJFSm1FRgqgE1Z1GW4DaKg0LRWHEiRZXK2tzELj4PAuyWFKc5
         MfPR83Hx9yPbYjloPGOVm+RSVhjB+0G2cn5c10y4tqgj8iBvIr1v2ZH7Nn5/yffnoaXu
         oBrA==
X-Gm-Message-State: AOJu0YwSJUngM6alvoJOT5lWAMk3xSY9B5g3FGCHTiktAxIfSUMj0Xyt
	GemEPq9jt/Hl3SiyBkDrfDqKdMe0AW4osbAXWu74KXGTn6p3dbcBO2r8qw==
X-Google-Smtp-Source: AGHT+IHAXOHlgl4KI7uZQIhTR92yJrO67GriBPPMPeNYLwIJHBsQs6FvSiSzbvSzCpIGf4Hw5+1Ecw==
X-Received: by 2002:a17:90a:7d13:b0:2b2:802f:e90a with SMTP id 98e67ed59e1d1-2b6c76f9803mr5643205a91.24.1715389908789;
        Fri, 10 May 2024 18:11:48 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca5124sm5717071a91.43.2024.05.10.18.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 18:11:48 -0700 (PDT)
Date: Sat, 11 May 2024 09:11:44 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240511011144.GA3390@rigel>
References: <20240507022106.GC26136@rigel>
 <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>

On Fri, May 10, 2024 at 08:37:08PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 7, 2024 at 4:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Hi Bart,
> >
> > I realise you want to keep libgpiod minimal, but in my latest survey of the
> > problems that new or potential users are finding with libgpiod the most
> > common one was that it is way too complicated to do simple things.
> > They just want to request an input or output line and play with it.
> > They think that should be an easy thing to do, and will completely write
> > off libgpiod because it is not - the learning curve is too steep.
> > And they have a point.
> >
> > I've raised this before, but I think libgpiod is in need of a small (and I
> > emphasize small) set of helper functions to simplify basic use cases,
> > like just requesting a single input or output line.  Maybe functions to
> > control setting bias, edge detection and debounce on inputs (using
> > reconfigure after the initial request).
> > The functions would be separated from the existing functions by naming,
> > e.g. gpiod_helper_XXX, or some such, so there would be no confusion with
> > the existing.
> >
> > Any chance your position has changed since last I asked?
> >
>
> Ugh... I really don't want the core libgpiod to grow... This sounds
> like the old ctxless stuff that was awkward and I removed it in v2.
>

I understand - slippery slope and keeping minimal.
But I think we do need some solution for simple one line request cases that
can get users up and running with a smaller learning curve.
Then they can learn more if they want more.

> Do you think that users actually use it (core C libgpiod)?

Yeah, they do, believe it or not.  I'm mainly talking the vocal Pi crowd,
many of whom are used to going bare metal to the hardware, and are now
searching for an alternative.  libgpiod as it stands is too complicated for
them - they just want to drive a pin up and down or read a button.
There are a few other alternatives that let them do that, and they will
switch on that basis alone, and never look back, though they will happily
spread their rather toxic opinions of libgpiod vs those alternatives.

> I would think they stick to python and C++?

They are actually less likely to go C++ - more learning curve.
And Python can be considered too heavyweight in situations with limited
resources.

> Would providing the GLib bindings
> help in this case? We could extend that no problem. Or maybe a
> separate helper library linked against libgpiod but also existing kind
> of adjacent to it?
>

Sorry, I even haven't looked at the GLib bindings, but I will take a
look.  The core would be better if possible - they would be displeased
having to install yet another library just for basic commands.  But it
would be better than nothing.

This is what I currently have in mind for the C API:

/**
 * @}
 *
 * @defgroup olr One line requests - helper functions for basic use cases
 * @{
 *
 * Various functions that provide a simplified interface for basic use cases
 * where the request only contains one line.
 */

/**
 * @brief Request a single input line.
 * @param chip Path to the GPIO chip.
 * @param offset The offset of the GPIO line.
 * @return New line request object or NULL if an error occurred. The request
 *         must be released by the caller using ::gpiod_line_request_release.
 */
struct gpiod_line_request *
gpiod_olr_request_input(const char *path, unsigned int offset);

/**
 * @brief Request a single input line.
 * @param chip Path to the GPIO chip.
 * @param offset The offset of the GPIO line.
 * @param value The value to set the line.
 * @return New line request object or NULL if an error occurred. The request
 *         must be released by the caller using ::gpiod_line_request_release.
 */
struct gpiod_line_request *
gpiod_olr_request_output(const char *path,
			 unsigned int offset,
			 enum gpiod_line_value value);

/**
 * @brief Set the bias of requested input line.
 * @param olr The request to reconfigure.
 * @param bias The new bias to apply to requested input line.
 * @return 0 on success, -1 on failure.
 */
int gpiod_olr_set_bias(struct gpiod_line_request * olr,
		       enum gpiod_line_bias bias);

/**
 * @brief Set the debounce period of requested input line.
 * @param olr The request to reconfigure.
 * @param period The new debounce period to apply, in microseconds.
 * @return 0 on success, -1 on failure.
 */
int gpiod_olr_set_debounce_period_us(struct gpiod_line_request *olr,
				     unsigned long period);

/**
 * @brief Set the edge detection of requested input line.
 * @param olr The request to reconfigure.
 * @param edge The new edge detection setting.
 * @return 0 on success, -1 on failure.
 */
int gpiod_olr_set_edge_detection(struct gpiod_line_request * olr,
				 enum gpiod_line_edge edge);

/**
 * @}
 */

I think those 5 functions cover the basics.  That is it.  Done. No more.
Unless you can think of something I've missed.

I went with _olr_ as the prefix to clearly separate it from the existing,
but kept it as brief as possible.
It also chains with the trailing "d" in gpiod so it is pronouncable.

I was toying with adding get_value()/set_value(), but all they offered was
dropping the offset param, so not enough benefit and I dropped them.

I haven't put much thought into whether those should be carried through
to the bindings, but don't see any fundamental reason they couldn't.

Anyway, have a think about it.
And I'll go take a look at the GLib bindings.

Cheers,
Kent.

