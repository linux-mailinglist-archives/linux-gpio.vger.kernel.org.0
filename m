Return-Path: <linux-gpio+bounces-10700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D2598D5A3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25C181C20DC1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057C81D04A5;
	Wed,  2 Oct 2024 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="irIPf3Zl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145681D0792
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875915; cv=none; b=mlLmJUSm19fwC4nLBBhbCvNGPPdEKvmViJrGGNszomZb39PMjsHXwxDp2VDVNcvQaGnf4S+33ZuaAqCH4TpTEPopUZniLti6/Rtcp4EGD0ECaqF61zEtF/vgadvZ8z7WE/kHeDl37A3pcX6gviMve1AgcDa2cS7CtiAfUww8X8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875915; c=relaxed/simple;
	bh=GF+FpjmHemMSnoXE4oxTn/O6oroaDnMhtkRnkeKXo/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTJjJkhAakxqx+Q9WTuz81C+WXly5nrQ4TbkBdFU93IxE/NSHV5LTL4w/sMEEQLC1iwV8ro9v/t5dC33L5yuYgoXMOs89f3Dw6B/Ky8yCxSoa2WMK6Idwz8vz5jrAiqRu7OqavvdlCXs6KTaipSev+/VyxHEnLKvVEJsgXV7FxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=irIPf3Zl; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fac60ab585so39644281fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727875912; x=1728480712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF+FpjmHemMSnoXE4oxTn/O6oroaDnMhtkRnkeKXo/w=;
        b=irIPf3Zl9QOmEXjCo/eoBcsLVJRhtAE/PGxa/wu/xTLJ13nUDCB6CkdI2o5/b7KhVN
         jxoY6OHMp1FUg+xOCNXoV8/StHFa1fDtuwgP+SP6bGlXC7LiT90V0uL3ja5UuJ4tmRmj
         MI/zKseM76AODqvLMgvHP7w+e8k5tK7Pv7gyXonMRtBrFJsf90ACyKHA6A9z+kyOQs/S
         k4QQnig5Y4EuPC/3TD51lTh7skLJBsX5NiR5k5Dsm1dnMmeLaDviD9cBTmr1b2d0atoo
         KrY1o+VzZjphgs85COEr/B3IKMZwsxGhtG6MX4frrpUvnfnclotixrP0/bRpRkx8Doqv
         L4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875912; x=1728480712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF+FpjmHemMSnoXE4oxTn/O6oroaDnMhtkRnkeKXo/w=;
        b=ED3jlj6FhoJ74sLIq5vymggwfIL8NC7d+NlVCjl/KgfQ1jVFIqb88BYYSCaJ+8osMp
         wWcNxJK1MFI3p9Kvxpth53KB+FHzn0g/32iOzu8ErJxwyv7dD/piGYBW9MKBGh+C8zpg
         LleUP+FSDdePzpM4jZfu1wbjp9u/zQwe69a63TuFAURDsvoWax8Vr/Agn8w+j/9oAkh1
         NZJ76dPmxtnIYJwvoY55cc7mTYyUfUmiH/a11sQOY9/L/vlndneLvmuPoHOUDQY3w9H4
         zErpoIS2isP68MZYNxbdcNHWcxGJmx1/rKYRMXLb3WGwosVuagBpKLRxtn/Q3nHCVnS4
         aVwA==
X-Forwarded-Encrypted: i=1; AJvYcCXJbPAAWDz0GgJVcr3OI6eQ0QsVkbY8hqdvyBu24Vw1dXyR9Auv1ktpfUbauGSKWFBCpPLMJIWn4Zk1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3igTXbTIVW9YJtNPpEn/u6wxQZSrLjPB1R63MePDRaAGu0fGu
	POPik1KRe4n5CrZyDVxK+k0VSrZkOHDPqOl9sOLNKZxuxeu2jiNUY2oEuroZ5TSKO2FvX3+AQUx
	y+aEEY4wREPSQacgwJdTR8ntHcidh08wBGn1a709xrXRqCZYwE7A=
X-Google-Smtp-Source: AGHT+IFp+pV6kUnrhDunKG+hHXERZ3Qxr9EP+o5uKrgLTGM/4nnbXUH2KX9osKs8zDfSk9Che9WUJeUTJwNk5N72jlo=
X-Received: by 2002:a2e:a543:0:b0:2f7:7d69:cb5d with SMTP id
 38308e7fff4ca-2fae0f7ab47mr22165831fa.0.1727875912010; Wed, 02 Oct 2024
 06:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926124424.2133464-1-mstrodl@csh.rit.edu>
In-Reply-To: <20240926124424.2133464-1-mstrodl@csh.rit.edu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:31:39 +0200
Message-ID: <CACRpkdZhSsU3K97gAmZhGhN_Jj72GhdQPQgJQpJAOjNXJqfw+w@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: add support for FTDI's MPSSE as GPIO
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:44=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:

> FTDI FT2232H is a USB to GPIO chip. Sealevel produces some devices
> with this chip. FT2232H presents itself as a composite device with two
> interfaces (each is an "MPSSE"). Each MPSSE has two banks (high and low)
> of 8 GPIO each. I believe some MPSSE's have only one bank, but I don't
> know how to identify them (I don't have any for testing) and as a result
> are unsupported for the time being.
>
> Additionally, this driver provides software polling-based interrupts for
> edge detection. For the Sealevel device I have to test with, this works
> well because there is hardware debouncing. From talking to Sealevel's
> people, this is their preferred way to do edge detection.
>
> Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>

All my review comments are addressed so with
Bartosz' nits addressed too:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

