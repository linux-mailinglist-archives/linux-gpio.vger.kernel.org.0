Return-Path: <linux-gpio+bounces-9577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881B968798
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84CE8B2219E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB94185929;
	Mon,  2 Sep 2024 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LAt6zT9U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7705EDF71
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280511; cv=none; b=OsP4Jpw/f2vhDJH2T5FI9r+xxiojUwsScoYGDzJKO1F5qjoCFXfgCdCJh51xsqPJmU+0h71zUmNR1BAA1UNFF9pPh8rEFdHy6khP+S0fWpPPgwj3AS2UI2YcrvipaOsIbvjKHvE/lS88JDx3k8I6v5BmVxF4Rgz5UjWTq95K0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280511; c=relaxed/simple;
	bh=5ePKlOnV1wWn86HVHXuHwt4L9SKwu7vupgGNA7ENl08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYWzjapHzABEa87EJT4S8jwmiibDaFlOswrz9Idlm5J2uhqYSlsVOfvawGCELWmlZR90jSg1t4BFspD/PNmMzpVYOQaGOnGcRoVO1pCh8UHcFR8nttvomeDaIDTYq64HEdGojBaxvtTtljrQf3gPiif+DErb3eQY/OrASskBsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LAt6zT9U; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5344ab30508so4889027e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725280508; x=1725885308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pw1aJAOXrixR6TUTNnns/dVDr/oIQjUDJUJrPgQykCQ=;
        b=LAt6zT9UqqmKV/18BvWq6c1m08xB9eTrOPOc8xSGHkAvrL3hD6Z01BkJHG9ODoDumN
         H4Fgq6VwU15AmtQkQcX/1y571An14DgaR+Pm33qFNNAToGsvzQAGHyQbP1QwoXL3cFNt
         +vYFGnfj36lSj+tzLyjAL9HOCl1gkerhz9AZS5RbGuTgvehQGhscaNQ4Z6UotwxFD6xl
         VRtnDf7d1eCSYY8q3jSVrNGMLnNCCZM6UIsN6SRF6kfp6j+5WPdxzlLipLZutxV6GRqG
         sIjLHYZ2uox7AHxr0wvB4xPwW/5VYA/gi3oxIeTxeonjkhLoGfcLKJlN3BFdlXTVdoX2
         Hd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725280508; x=1725885308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pw1aJAOXrixR6TUTNnns/dVDr/oIQjUDJUJrPgQykCQ=;
        b=fzoma2aLIk7s0hlRdCFDeX21I168CGFaa0T4x3uw8J09Sx5XbBzWZ+7og5wJnCFq4f
         +bcEZfiCcT9+polZifA8sMSbREOpt87UeMPMD1v0oh79/FgrgaOyr99Be1PXJE9LUFJd
         MIu0qh0TcTwhpBANLMorqh4uTFDnP+INNGndFgsXT0gtY0s6l1hr+H9hndIK4U2U69C7
         YUhN/G9z/025veoXCz1LlsSir6we5d0dPA/4BLvzMGGThEri4RkBHqJUmmBB5NKmhFwt
         AngK73MEzlmw5ocmFmWNxnodhsqIfkeyFTXLqRC/aTFHu8GDLd46pf8V98I6CVpymWAu
         m0/A==
X-Forwarded-Encrypted: i=1; AJvYcCWz9kjCYIK0mWGh7KbQqLKlkIPMDK6Z6UiW84yPsWiYzekkBl2J54Ykd+PJXUZrUYN9VuSLur1QJOEv@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZGrabW67uYSd8Hq6bPgKUuG4y3pHewjzKWj5BL4fQaBiPl7L
	PNkgVlHQfQRgLVRsKMnZLYYQntn7/Wto8AyCDvxx+EnPDaI4BFlGlN6p9SLO/8Tr/8tW3QkmKxN
	qEDzelKCRSfJGglAkDsUUGQT8N2YEUeb5nYRmqe5O1wAfQ8+U
X-Google-Smtp-Source: AGHT+IFR8ir3pzwR1vG03zebP3b957HnmOuJCMw+Yhq7P3ScciiovNTTo3H2/+/m/x2OGk+vk1tFadnUcofYIkrYpok=
X-Received: by 2002:a05:6512:2812:b0:52b:bee8:e987 with SMTP id
 2adb3069b0e04-535462ee2cemr3730497e87.3.1725280506817; Mon, 02 Sep 2024
 05:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
 <CAMRc=McgbL5DCu2mr6oWERMQMFQU1Bm-1BkC+XR=-2fPXpOW4A@mail.gmail.com> <b67efbc8-ff21-486b-9961-498eae0f85bf@linaro.org>
In-Reply-To: <b67efbc8-ff21-486b-9961-498eae0f85bf@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 14:34:55 +0200
Message-ID: <CAMRc=MfnyapSZUWRfTFbfmD-b5YotmWLFzdxG_W=s=bdLULgGA@mail.gmail.com>
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 2:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/09/2024 14:03, Bartosz Golaszewski wrote:
> > On Mon, Aug 26, 2024 at 6:18=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> Drop kerneldoc descriptions of struct members which do not exist to fi=
x
> >> W=3D1 warnings:
> >>
> >>   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock' de=
scription in 'pch_gpio'
> >>   drivers/gpio/gpio-syscon.c:46: warning: Excess struct member 'compat=
ible' description in 'syscon_gpio_data'
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >
> > I have a different patch in my queue that addresses the syscon warning
> > already. Can you resend just the pch part?
>
> Heh, you just picked up something which was sent week after mine. :/
>
> Best regards,
> Krzysztof
>

Sorry, I got back from vacation and was just going through the inbox
in no particular order. If you really insist, I can back the other one
out but I'd prefer to not rebase if I don't have to.

Bart

