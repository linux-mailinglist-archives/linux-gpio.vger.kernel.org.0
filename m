Return-Path: <linux-gpio+bounces-8700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF7A94DE48
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2024 21:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E8381F21A6F
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2024 19:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B3813B5AF;
	Sat, 10 Aug 2024 19:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vf0TIIfI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643D64644E
	for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2024 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723318608; cv=none; b=dD/Jh9gAKQQPq+qYTz/T3QQBzN3fbtJgr6UGgz8nlrrCJ0M7WMY0/HCAxJikzvp3CWYV+RLY3Ely0TWcmkIXXC3Oz2koJofO9saxq8Euz8g9c/9nTXO+TG2C2aqbjZqaQ8zUa+M2aKj0rk61NWFfCV2+tkItd4CFp+b4K0CaT2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723318608; c=relaxed/simple;
	bh=vQXpPUSoz23rBiKwo+2bVpz0imVAQUZNKi8DnEBytoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciW7El83bweLB1WUClSvIT0vWUa7EX8SHcOS+M1HvVvP8nb0uVvNE3EDgr+xRvnX+84yJgPtwYMK8TWIfLm9gP/sxW1Xv5TWFh2mOL9JHT1PiUTrRqc3CliyXkMX9T/coPXa0wKAQsXPOM3cHLQ1oQklTxWdMTVGMoQwXUzorDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vf0TIIfI; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01afa11cso3768964e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2024 12:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723318605; x=1723923405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQXpPUSoz23rBiKwo+2bVpz0imVAQUZNKi8DnEBytoQ=;
        b=Vf0TIIfIR4DwkxbZYMRyBGyv1Wh/xxfGp2JeqUJwh2S7mp5bRqewugxer2e2s2iv1R
         wx0vLhHAFi2FRZCrg0H+U3SAW+Cv9ImBGf3Sk64Thjtm72fTllKNXRhQ5cCu3L7a1W2l
         9TUMyVMZ+3+d2LtKfJ8m05Hm5mW4hznAZAyC4RPJEGxw010Xf9znBUWHjkeuJI+a+t6R
         HyDEtOjTGT2wAzk5B378dHhDGMko3uQZc19wDL2bHsqC9Rdo06sXUn3/2aomwyBqpBrh
         O9fweRwLsraFxIrgFroliFW6nBDhWbQ13O38C3aBBi4Re1rbda16bOM4ey3N20fuIueq
         zBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723318605; x=1723923405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQXpPUSoz23rBiKwo+2bVpz0imVAQUZNKi8DnEBytoQ=;
        b=t9V3pB89RyuVqwtoxpjOWqp50+DbEmxeOor4iUo3NymADEefVkyEzx2sZusTcXfIY1
         kgRwczBdmJXJ0KogrQUyCE/z8ajT+Aw+3/TDLtyiKyj4cfkp55PBIFOFWnxidoZjrgnU
         Wemj5b6a9Hi1QIE64s8xIcVWesSzH1x0M8pJoU4TwFk6SrqEkLabi/gXTcutMbLlSM8h
         8eMwvy12/+kR17BmGpNlSl19kXgyUjy2fYmTVB3brnrhDr9XLZ733Qebq7+nNTTe2NvX
         qNxo7tYrChSzz3c3jBH6xaCPMW8revOX6l7nPL48fNRpMLPeiOjzqzUEsg+0MJsg90JZ
         o0AA==
X-Forwarded-Encrypted: i=1; AJvYcCUh6nNy6ELV+fU2HfxgT/2/tmSq7gbRcENYX0Jc37GksjSJYyNY46L9gnh+NO1vDzg17g/6G+JffHV666xEMm4hwVJCKxqQZBzrqg==
X-Gm-Message-State: AOJu0Yx7QD09bTPnCfDgBcYoiKEs6GEcTdZFBZ+qnv66qk2D05Ixj50Z
	oN5KTSMromBybUS2+w6g/pRJWy3QwOlx2e+EVtHTC4G+w5mkw/p7UclwQrkRVhJLFC+PkTJtfSl
	2STWHvcQeBbM54SWHz5FgIy3tbXEymsVOlW3Deg==
X-Google-Smtp-Source: AGHT+IHM3MQLGUf+ALuJpLXd8sYeEiHP8VqMS5QydvRbbjBK553Kdl8htvQ7Gn9JnasP2KoWY4xgakVKfLS116tqeiM=
X-Received: by 2002:a05:6512:1150:b0:52c:9f9e:d8e3 with SMTP id
 2adb3069b0e04-530ee995c82mr3203328e87.31.1723318605290; Sat, 10 Aug 2024
 12:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611171509.22151-1-asmaa@nvidia.com> <CACRpkdYJyeOYYraBn6GKrCmRGO1L8eFsWPbhsEqc0OwXUWVorg@mail.gmail.com>
 <CH3PR12MB7738928E3B528F9270E1BACAD7BA2@CH3PR12MB7738.namprd12.prod.outlook.com>
In-Reply-To: <CH3PR12MB7738928E3B528F9270E1BACAD7BA2@CH3PR12MB7738.namprd12.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 10 Aug 2024 21:36:34 +0200
Message-ID: <CAMRc=McyFzWzRRA4-nD-DFYaOSez7LLZmL1YuJibfnUs6nbrsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, 
	"bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Thompson <davthompson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 10:25=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:
>
> Thank you Andy and Linus for approving my patch!
>
> Hi Bart, could you please apply this patch?
>
> Thank you,
> Asmaa
>

Sorry, it got lost in my inbox.

Bart

