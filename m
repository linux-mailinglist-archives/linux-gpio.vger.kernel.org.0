Return-Path: <linux-gpio+bounces-29732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F866CCB302
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 10:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7F01304E8E8
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 09:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDE633290C;
	Thu, 18 Dec 2025 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDHFLroe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7433328F4
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766050374; cv=none; b=Ru4V4OrBdW50pkWfkCDXJ80fAVKrrACgurEQAf3L/jQHstzHL+V12B3LlxCuX7PnPLw5IthP1nUZoHrZKF3D6xd7UBDeRJeiEvmMY0jtI6mbLgcn0nier3lzbOtAt15V5OkzshW8olQJOrAstjvcIMb9c+QRdGXKonMpesSzUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766050374; c=relaxed/simple;
	bh=EnQ5X8UqCacfM2+VnkaV7I0yNk6b8t7/CjHBmYVAIag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rw1Kc6HYaN2Bo6hwmk4xBBNYxso8kmdgLW+HZpmok/bL21U/4uZlRwvlDO03tAbAD4X2v3bBm+6M8bd1JQAD3t/P6zXQepkKCoKdfGjoZvsuQnqYxvX+15AWEnvhYs7/rtkDUUdgdjy41XaQc6ISZrL1lLGffBaN/3SyY0psae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDHFLroe; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so510768a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766050371; x=1766655171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnQ5X8UqCacfM2+VnkaV7I0yNk6b8t7/CjHBmYVAIag=;
        b=XDHFLroeZjUsVnWqf6czlXeWwFYMwTjiHIcdtISBhdAQKkz9cRIo9VE2sPCXDtzyrw
         EGxfc6PJqbNoZHZhtMQOKRv5esrFcTAL5EO/JDHLeeqc0dwbAYbQ8LTUsINRVHKsbwxs
         ZR+mN3CgpTYBFyRzB286Bkm1f3dm6jk1pu4RXalhNY0csNOIh5WCnt/RgK14I+8/P6FJ
         nI6zZpaExWUrPN+X8VHVgL7jaQa0829yrRqW+edm5OV7MHURtar1tynxu1HnxLK20nBs
         Z6nftCvczHz5VrluccbotiEkkYZsyX4megfiYAAjWoxQyitOeZqICslAZwmKe3UItUKV
         LC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050371; x=1766655171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EnQ5X8UqCacfM2+VnkaV7I0yNk6b8t7/CjHBmYVAIag=;
        b=FQz8r+wtZaqIb02T+2/j5wwwSgV4ZrsYMh3iq3D4WZhEhtcEO2l8ThEom/gc8+YhRg
         OJMY9PwCW+KwIYSryomeMxEXavKUOS8DRAV8V8LjxS/rfO5U9/WRMhpzQGl2orDHxD/1
         UrOOCbM1SRwGKWd5drTn9ZMuFmtXF0Wg7R9tT0J48heuu3YlcGD7FfSCpS4zmsx0xkuY
         hu0Z6R2ON0guZ8hbGJhAFRS6naC2EyLE5PlCbOoyRJdp7CxbW4+7AW46y+GYVo44oBBe
         fID61fOHugZHFATcIhp4Ky3uTXqbawP6ufrLWxSs9jRk7NygycPckNgeJWdau4ZHCfsV
         +tgQ==
X-Gm-Message-State: AOJu0Yxo9h04HuQ9Y4tOaVsAn+oEuBcVrTyjiEDDb448J/za+IBRBHlO
	HvUCo5TddU9i1D5fwAOn1GuAQmK1EVtoMVGZiszXMXUyABhj1DB59opFCgKJMpEWckFHQse0W88
	ePrJFrCM47TRdcv94uxyio87YX5Gp6Nc=
X-Gm-Gg: AY/fxX6/Du6D7kH3b6XwN+J2t9P832TccFxhm5H3DJ1w0354Pp48YXtPLdmlPBo5IL8
	jztiWi3uWVdCCYGW+Ytv+MuvYBhj3z9XqZSyAO2jcld4f5dC2AMwifRVHwME8/fDzDKNlXqDT0I
	1lOE+43Ks2kAHWLnxn2euUNWaufwwSOKmgLWwyoiX+FMlOGYX3xZkmgSwlKyVluL0N7n+zfWvms
	7orO89bYWddKu8M51kmt94G79DzVPksKDIbJytUE9GBCcn45SRabljk1b0pHdjqdkjAgf23Wjoq
	UHUZ56jq
X-Google-Smtp-Source: AGHT+IE1QyJImJkNPANHGEc9nnZY+S84kSi30zApV4XHtp1+3wGFpo/NxumfZzBAk+jHB+j/O3kJHLCVv42u5dm4MBU=
X-Received: by 2002:a05:6402:2551:b0:640:74f5:d9f6 with SMTP id
 4fb4d7f45d1cf-6499b308a06mr18187216a12.25.1766050370441; Thu, 18 Dec 2025
 01:32:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217063229.38175-1-rosenp@gmail.com> <20251217063229.38175-4-rosenp@gmail.com>
 <CAMRc=MfnN0sD=yb7NO6ixHC-mhv2Cg5qw_wb8cZGtg23chwmOg@mail.gmail.com>
 <CAKxU2N_SM7EauHNpu+Ko5bHfFUkONMVGYNRfp6jAL_wjcJn9wA@mail.gmail.com> <CAMRc=Me7Ogsa9qXzwzdS_oWfVXaAYhK4E9onB5FfOO8LAU4pdw@mail.gmail.com>
In-Reply-To: <CAMRc=Me7Ogsa9qXzwzdS_oWfVXaAYhK4E9onB5FfOO8LAU4pdw@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 18 Dec 2025 01:32:39 -0800
X-Gm-Features: AQt7F2ojjJDvRtNFzRaZwSmOCawFRle8ByRJ28vfmCyK_D3qK6ALtNoTMz8G-hw
Message-ID: <CAKxU2N-vr=GjkkXLo_f2M9MAf2GEmKjK8J_pDwsY7jd26p-AYQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek-otto: use of instead of device handlers
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 12:31=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Wed, Dec 17, 2025 at 9:26=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wr=
ote:
> > >
> > > Yeah, no, there's almost *never* a point in using OF-specific accesso=
rs. NAK.
> >
> > Argument made to me on netdev before is it's pointless overhead for an
> > OF only driver.
>
> Would you mind posting a lore link? I'll gladly chime in.
>
> Drivers are OF-only until they aren't. Vide: lots of discussions
> currently about supporting ARM laptops and servers with mixed DT-ACPI
> setup.
Hrm I must have misremembered or I can't find it. In any case, these
devices will never support ACPI. They're all embedded devices with
uboot.
>
> The overhead of going through the fwnode pointer is absolutely
> negligible while using generic accessors allows taking secondary
> fwnodes into account.
>
> Please don't tell me people are going around the kernel converting
> drivers to using of_ routines?
There's one special case I know of, of_get_mac_address vs
device_get_mac_address. The former supports NVMEM. The latter does
not.
>
> Bart

