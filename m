Return-Path: <linux-gpio+bounces-17094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B13BDA4F8FB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 09:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E71B3188910F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D665D1FC10C;
	Wed,  5 Mar 2025 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU8QiGms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D20A2E3385
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164071; cv=none; b=Cos60DoGzmJ7ahpNEHdcce30PHfQC6sbkDd+BkMfcmsMG4IAL9Ld9FlzWzAmpdO1G0XuyrzBCixNW+lkdbfajThFMbfiNzluhJMOaq6xfNLAHpxgoNNmzyapMKwqTz3NKt2ueyvLDsvk2SKnD5w1zweFearPFEGLV6xyTk4zMnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164071; c=relaxed/simple;
	bh=p0wRAPvWe2bQO9H2Q+vnpMf1+sNWV52BpeYfCI4aVw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juxmrnWJYa6mlNzzo+c4IjBLJE+P8GomCqep96dpxKdNYAuQ++queKxqtbSbCd/zGvNpKBw9BWLoABVDlyHseT8M1qCG26w5k5B1iTSlF4IGz1StySxkb7D3E1XvADBOBv41j5bHRL9OBvuB0PH5ySHDlZb6Z9nQqi27Edag9/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU8QiGms; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2234daaf269so1096925ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 00:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741164069; x=1741768869; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9YPTOXSH2vXjUBMH9nLGPx+lmWYVDbGU2lcNbi5jBg=;
        b=TU8QiGmszaBx0Z7t3fDX8JL9dT6wXa8aZ9Cb7CYqmAR2cMzLCw8xUsWXs2K7d0MxAb
         ivT8niePhPQVPWFo8OlBTMEOPj2LU3tIYJM5vxRW0SwGWNKyxArtPVENfZOLCyIM3RDX
         PdnxCSFx5fRtFsW8DtzKXfnYjJt32mLUudHGlFqKHYK9SDMfiDgcJwI9dSksYCFKHUt5
         QXDZC+RYLasBqQbgLCpLV3pOE8o7Z5FXH1v/Ba6nhSavsF32MPaow3ByqTHMB3sQr+Lo
         CxI7RFtZN319dQ83iEsrq4sr0gl2Z2dOPecsliN0LkvFDewCAlDjuF/Rj5JrvH8cub66
         K4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164069; x=1741768869;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9YPTOXSH2vXjUBMH9nLGPx+lmWYVDbGU2lcNbi5jBg=;
        b=q36halVdaS8pGH9Jm69SQajEm48pzrfMWAbi0XpPGlLeWylLSZ7vDF2PLZTvpt6l1B
         SvwJyn/6WjFzTXIMzArVzBz/oFtWVG0d9/hvkVpTOtKxlsfCyI4/p6IpFa8zRitWHSdp
         IUnWgt8r1V/06wzGrsUwEK68P0XKQ7vaDb9MxKy0+ib43UGX0/CTJpZ2hQ/Rb3TjwZcg
         8ujM2Nv3ksICUhLnnXAEpjb8srJVnHQ4uzANXTInM7warKEvV5heUP4qBu4XzNzv8VZZ
         901GxqTG72l9rSAhkcZEmT8iqOabARkKqbgWV5rbQ1kpWNBeph5UhGy2RiUDP761/H5o
         j5FA==
X-Forwarded-Encrypted: i=1; AJvYcCVYjyw3oWPtb6NpjkRffLIKhwL8rSOuyX5Z/g5OdJOriDLegmGoEEMzkph1VekcHZisyb7iXRvxb0ID@vger.kernel.org
X-Gm-Message-State: AOJu0YzBVEvoLE+M8qq+ExQEyILs21PE/61jgHP7oLHlZ/Tmt59DjLX5
	DZRMich54f+LR2bPLOZES2dtUh7vE1KAQt3AARduk5cwu5HkdG8M
X-Gm-Gg: ASbGncsjcy3sqiH42jH1fMN4WDc3Bt50HaBEQfm/6sji7TveVs9dVaCb4qaoHByPGjZ
	2/tudljggGOYPCdOAW3U2dstM0DaJok2Jky2RXqvLE1+NSPZM9N+5uUWSXyb486YK01glCrCPom
	Ntc7RDVaWVGe0RMJ502XhBF7wOZXy7REeMTsSEHmjwLaVFd99wUzJ/JT0MBXXVjdPN2NWsa4VKW
	VkIlUs5nhsfUCK1Lj3OK5yfJzphks/rf+YHdA+gfZMbq7s8E5NJfBfR9rmBLirRPgEkS+3N4Mip
	cpLt9z/KrJxz3Z6Rq84x57cIUoNf6h/OVEdjYi+Q1jDtCl9eY+eW4FhJ8ddRrazOZDUM
X-Google-Smtp-Source: AGHT+IGYnEKajl5w3Ho81gyjohzzvlFnHqDlrdB4fh2ecykSkVCkzjC9bMBz2FZUJYgekpMtta3wHw==
X-Received: by 2002:a05:6a00:2343:b0:730:8a0a:9f09 with SMTP id d2e1a72fcca58-73682ce13ecmr3119414b3a.18.1741164069037;
        Wed, 05 Mar 2025 00:41:09 -0800 (PST)
Received: from rigel (27-32-83-166.static.tpgi.com.au. [27.32.83.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364c9541a2sm6239118b3a.21.2025.03.05.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:41:08 -0800 (PST)
Date: Wed, 5 Mar 2025 16:41:03 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
Message-ID: <20250305084103.GA125901@rigel>
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de>
 <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
 <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de>
 <CACRpkda-0+9u1mu8gJPwE_2ykY0TeoDS3t2_D-HoPgUQ45gfiw@mail.gmail.com>
 <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com>
 <CACRpkdZ4XOrcSOawd551tNx7qzexOguzboaA_6Z36QPfK7a0vA@mail.gmail.com>
 <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com>
 <CACRpkdaQ6EwkN+139Gn4Xe=RsOthv-GNwaFJGvUdDF53SL9BMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaQ6EwkN+139Gn4Xe=RsOthv-GNwaFJGvUdDF53SL9BMA@mail.gmail.com>

On Wed, Mar 05, 2025 at 09:22:42AM +0100, Linus Walleij wrote:
> On Fri, Feb 28, 2025 at 10:53 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>
> > Let's keep it simple, and similar/identical to the existing API?
> >
> > Is there anything in Documentation/ABI/obsolete/sysfs-gpio
> > we can drop? edge?
>
> I suggested dropping all of the irq stuff earlier in the
> thread, given how bad quality it is. Especially if it's edge
> triggered it can easily squash 100 or 1000 IRQs into one
> fsnotify event.
>

+1 for removing edge and poll(2) on value.  Keep the sysfs as a very
basic set/get interface for environments where ioctl()s are too
burdensome.

Not sure that active_low serves any purpose other than adding confusion.
Drop active_low and only support physical levels?

Cheers,
Kent.



