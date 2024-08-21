Return-Path: <linux-gpio+bounces-8944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFDF959B82
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 098F9285928
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35341531DC;
	Wed, 21 Aug 2024 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFkOJIsk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10091D131E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724242630; cv=none; b=UoVvCEfZQ3Vh6u7M30NC4ICO/7SrdZq/MfH4mZrYAgEgq90wUfZ2Ei8EyD2pMpkpG4x+ev0vWEkIRIGqNr+QAjFVVnkHNSAfMJEviZMSWTBI78RKusRE9uECCYoEKuqmRBhMNHcBMiWoMnJaKqqgvS5FAPnOikvoB3CX/aWsbiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724242630; c=relaxed/simple;
	bh=aCJ48Uqkefd4MXLdTDKORc5Wr6cH2WYmnPFhi02GR3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIxvExmgGG0vMty4vZLLlOjcER6Cs4QJ9W2lxSqIp0yfzc1Yi9g9g5zJgrlljWdDw/XEOLj1bWzo8/FftDbg1G9lt5saxTS44YY2xkaj7XHti+SpzFe1G6Sczk0AUMM+aoulK/QsZI3szGsmlwki4MBHvS+F+FnO77xhas6mnIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFkOJIsk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53346132348so1686610e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724242627; x=1724847427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCJ48Uqkefd4MXLdTDKORc5Wr6cH2WYmnPFhi02GR3s=;
        b=CFkOJIskT0WIeT3Lt7juDKTBPPBLFThyATE0YczU5qRQEAe7JIIGj0GAfSYVeqN3Ci
         WehuFvMEYCJpGleBr542DWfKgYEZ8mUsxCHHxrCqXJrJaARgbAzHozjkr80DvKKEZ20K
         V2dy8fgtu+Jd+ctMEXA0wIMgb6PnVKoBLMh51x29VYgROb/VrZ3dpqdcI5HC8KEW5s1p
         hUcuAK7Nkml8mpJOB60LYDWakRFS6Hka+3ab9Ag5O9hbnL/ooOPyQGHoyZNo71G07LPd
         EEGmY8rpPeesC/LwWh2cLoqckEqQis3yDgtKcvGiqCkwS6LbzG7dkolCXYnYBLpXNPTR
         r7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242627; x=1724847427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCJ48Uqkefd4MXLdTDKORc5Wr6cH2WYmnPFhi02GR3s=;
        b=ku/V3X7lhdbfPQz2fT2vc7WKC/q28qauLpPe50BmzzqFfFydAIa43HVRHAquh4Xghb
         agvwab/PyaEUhmlSN4L1OuHyOJP5OGOWJYSJI48Urn70xKL93LB7SXFVsc0U4DfV9VLe
         8ysXM6Hv3FI8yDxN/sdjpokENcubt/etD3Zv1aNW5S0x9lDYG6DiQ+aQog/6xpdbanjX
         9sHTRQU8pCXMnzUYanBlLXUCpodiEdM53/DXaSc8HV9nGOEHn85gvAEw51OJ92fRVA8H
         Uk/yuE+lA0lircBGR5MraCivNhJRpPmt6z7h/Eu9lnCsVMyG0aAg81yc6teEEU+T84z7
         lqyw==
X-Forwarded-Encrypted: i=1; AJvYcCW3oLMCjbF2OtTiUIQaau1YsmNJ+hOPsZiFo3OtrvbXvXENunQ0spLtDNhXHSGWN1Ug+XK2NzLIlDjb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/VKHb9SAAbYU3+xgoscqan0Xy9s/oCcb+35o5R0R8TDLPk1J
	5S//5ufzWPPHBlvnlSK83BlHLet3fI5X5oKtgEuhu8hE0Z6jAYnWFSA7q45o7yDtOAzGNIQ33HT
	eK8eIHsyo0et8nGGLCE7wpcUBXqk=
X-Google-Smtp-Source: AGHT+IFKEPvqwJvBfpFqnKr9l2WLGfL8jpDH4Xwv+kuS9bllWozv9XctGdA1VMlYoGDmDh0FrmhOo9kOdmUPb0iJiGo=
X-Received: by 2002:a05:6512:39ca:b0:530:bbe7:4db3 with SMTP id
 2adb3069b0e04-5334859101fmr1382823e87.39.1724242626549; Wed, 21 Aug 2024
 05:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821114202.2072220-1-festevam@gmail.com> <CAMRc=MfNOKhnn1hE7_Ue8nNkVNHrDsyLQqz3ON39C2zfLmkOWw@mail.gmail.com>
In-Reply-To: <CAMRc=MfNOKhnn1hE7_Ue8nNkVNHrDsyLQqz3ON39C2zfLmkOWw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 09:16:55 -0300
Message-ID: <CAOMZO5C6=VgQcC9WJ2c8F6_k_nKFZhqcxzYcprG6SzYGf7ryzw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Print the error code on read/write failures
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux@armlinux.org.uk, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Wed, Aug 21, 2024 at 9:11=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> How about using dev_err_probe() instead?

pca953x_write_regs() and pca953x_read_regs() are not called from
probe(), so we should use dev_err().

