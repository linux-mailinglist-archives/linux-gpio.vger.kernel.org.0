Return-Path: <linux-gpio+bounces-28917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B810C74559
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 14:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0B7A346199
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 13:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E823933A71E;
	Thu, 20 Nov 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Cj/79O9W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A64333D6CA
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646198; cv=none; b=cX32R2k49w9hkALTfDosKWPmVZ/z1pKDGNC7Ieu5A6vEKgdQSFJ4UJ5N8fD0Bv+12IVIX4ATbZLjocwMpGmb/YSjy+NKEyYyzl9mMl0R1wDmNNjEWiL1vyC+NlOF5oWkkTf1SGOYJRvuItUPfme87+9GwamC/TbVnVEeOTz3K6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646198; c=relaxed/simple;
	bh=wa1cYreEuhPusWJYYO4Ix97DcBazcxezDPQ9b/FQHWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2ydH+KsUg6SxEyX7wVtZhun547OeoTRFcFVblV+Oj58Yi51uQcgTzWt38rGlT8gl/R+3NmzedID18m2uzNonzbMbHyW+5+qrrV3wHtVlIluR7miuhx8rMk2LTb4ZOWfQkT5TXpR1UynasNoG90WVrNaFCx9A/JqUgnaEKhenZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Cj/79O9W; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5958232f806so962790e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 05:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763646195; x=1764250995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa1cYreEuhPusWJYYO4Ix97DcBazcxezDPQ9b/FQHWo=;
        b=Cj/79O9WEhdKJxf//LRXUZc+Nylb6F95PCDszy30q8Fm2hs1lw+3y//OLe76LaEjs9
         W2aLun9scc7aQlTDrBqdVl9qgk2B7ZliCeU++iIRB4vWCwxURoBgN9FZmCdfiHbmH82b
         Nb4iRV21nY9kJ78OsiXKxkvQPdXN5e+4Nb6ISmx6avow1o2gmfjtQ3Tt3KJKCKUTLtEJ
         kDFh3jHRVoT+KR7MMlLSnkCweCu01NiTiGXXBxyaDoD9ZF0bHBnt58EMaaiv8plDfTbr
         t9L6vmqiqB28Fn9z60T2DAJ+pby7/JCLMTe//YiHEWvgbNXkEWVoqiip3tZnA9btYx/1
         RSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646195; x=1764250995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wa1cYreEuhPusWJYYO4Ix97DcBazcxezDPQ9b/FQHWo=;
        b=mjZrfWZTaTVlkxJNwLuywMzrwZa5wW66V9v9YKE5UqOMuvw3Jb5CJH1edv85t3atjp
         FYr/yUp297R7KuAeWteEDDnhWYJHS3MrzpUINiVUkrPsUkC3oa1fehmZB1yUTxrHQ3/T
         VUfNIA2aKZ9yDCVSkUYKeH8zthZ9mlbO6KBcCB8/D9tjHI9vB0j1Xcypwh0mRtCeji8E
         HJ2Rk//n5hqA8YZ/yPknNUUYwDIuC+FChwN8REhgPH4EviKLOktbrG0gQf53dN5HfIj+
         KIReD0TV90fUG5HylakxerB85t7lv6ndsuc0FOcx+Yfi33U8EFPTrJeqnB+umap39yHz
         rWJA==
X-Forwarded-Encrypted: i=1; AJvYcCW1O3pmRWS/+gfD+9BwYQhvRyHa3NMoT9ZetIOKd+fBjaUXeoBhytzXCLWFcNBpjhMJLi62YJJzQ2eL@vger.kernel.org
X-Gm-Message-State: AOJu0YxaSHO3MBCMTlX1fkenANTfVKCAuRgCum8vR6bXAsZ8J65w08U1
	XRXQMY0jTotX1YyM3gwZzJf6pwW05o7dhtGbtYK1qdGHP6fTqPZvqzczlqwRndXaVHay67gma8q
	/Y9gf9xjzhNcINAHPdTJne034687ih9oxjwfpAEyv9w==
X-Gm-Gg: ASbGncuGy2G2G/BX2iLEOAG6sECIa2V0dY1V1B/FXYhjPj29huMlr0/qyCCgD7xeaYx
	tZXfYgmB3Q4HQ5ZPH/OII/FKj1D89gGOzyff28G0Y5Rif6YOygcoKTV7g16D56vIZjFD44Rk8+I
	qJIVKHcnuy1mi+nDdjleM83DZp2OFFSzvy7pfmnYAnIIQdts26jwV8ez4MXRosNpgEPpabHZAWB
	y6F7eyAKeTHIhqr+OmSXpa3utWRpTZ1NRS3PLubWD15kcTdzsdeJ9ogpqFF17knDbuNFqm18Ojc
	QUgI+7Q22iuHVdFYyEQ7kG3RwQ==
X-Google-Smtp-Source: AGHT+IEv/hvofFpnwmg1EFFXAO0BKbZx04dZ7a8h59chxZ1fDoMYfsth8URZsqMBbgdoeiJHb2EE68PocBZxwM7RQPk=
X-Received: by 2002:a05:6512:1096:b0:594:273c:e816 with SMTP id
 2adb3069b0e04-5969f49a0ccmr721176e87.30.1763646195156; Thu, 20 Nov 2025
 05:43:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120105907.1373797-1-ckeepax@opensource.cirrus.com>
 <3beb841e99f62767547054c4344f2c60eae4ed9b.camel@pengutronix.de> <CAMRc=MdJp8T2gZ=ExWCOKSaVqZqo4Dc2qAX0hXkx98ShUx3mjw@mail.gmail.com>
In-Reply-To: <CAMRc=MdJp8T2gZ=ExWCOKSaVqZqo4Dc2qAX0hXkx98ShUx3mjw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 14:43:03 +0100
X-Gm-Features: AWmQ_bmLUVCGUTc1rji11XbGDq5H_oq8sqkiig_6rGRBlDJnQgdBjd2YrcPQObw
Message-ID: <CAMRc=MdM-VCJQ_BwjHTNzRxipQPObOvz8K8NGRjy4k+5TDBpGA@mail.gmail.com>
Subject: Re: [PATCH v2] spi: cs42l43: Use actual ACPI firmware node for chip selects
To: Philipp Zabel <p.zabel@pengutronix.de>, broonie@kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, linus.walleij@linaro.org, 
	andy@kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	bartosz.golaszewski@linaro.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 1:27=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Mark: can you Ack it and Philipp will include it in the immutable
> branch with the swnode series[1] I will resend?
>

I've included it as part of v7 [1] of my reset series, please Ack this
one instead.

Bartosz

[1] https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-4-a100493a0=
f4b@linaro.org/

