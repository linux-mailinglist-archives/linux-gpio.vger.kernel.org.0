Return-Path: <linux-gpio+bounces-2584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE683CBAD
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 19:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EF70B20BD3
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 18:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BD71339A9;
	Thu, 25 Jan 2024 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMHSnPOk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07881130E52
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 18:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706209082; cv=none; b=UXn+ITOS03QzGtrbWpd3EX447iSy6uuY3zacf9/HMt8od5+RuBYyr3bRBddliPRoANLPHPh3bIKV0bbjNyOF2L9QgpszkfmZpRfV7VU7FBYalk4aQL2zdMqQfl7mjHuzyrPNc6BP5D58pMgkeedwzKRuYLF6TVCzUVH5XrqVZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706209082; c=relaxed/simple;
	bh=qJ/gqYsTHEbsBqWdVTg8xuamhuTiU0rEfmQQT00Gtg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYuBC2jJPdxac7zX1saWTBM+3l//rPb9V3hDWh0aEVkJFQA9bb0rWNKx0VzETzoU6VSW0mAjmBfKZC5Ci6OIi4kU+8QaJR1OJmqsBA8fb2ToJ6SC/vJpF59bBPVbazV+3MZdklS93S1KR+QDD6PBEC8s3AKChW+QlgpKa2j/BTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMHSnPOk; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a31a69df7ebso61558666b.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 10:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706209079; x=1706813879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ/gqYsTHEbsBqWdVTg8xuamhuTiU0rEfmQQT00Gtg8=;
        b=CMHSnPOkBU+T4Z5DC630+b8hJUbyHG6+4C0OTTkVEmSMT51XvrVHNZwhMGIKbmHPx1
         ZR7tTI/clAUq0toWbA6CCOg4OJwy2tuVSNty3c8Alqr4kbRT4YENJqbtw2r5/mUwSr2H
         zvKDdXH/GC45huFOuNanPbYTk3rr47KZj/MArQasjbrfdj3IJoQXFzykyA+CQzQIqNRA
         PHL1BpQIB/lXpqrpPfYNH/k7Pzs0SeHnhQiSj5uhKSFIkpOwfcDg4jXYOgmU8OYFjpX2
         HPQ59J1weIXXijjgYstt5QsBYNWe7hHLMlK03Irj+fz03uRUzXrKFE/bTakxSZWoqL/K
         SBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706209079; x=1706813879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJ/gqYsTHEbsBqWdVTg8xuamhuTiU0rEfmQQT00Gtg8=;
        b=HoYVpvSjCNLZgra3yVZpRk1uU77bsYW1z9C4gPWvZpmLAQR/Ev3HWBRwS0zvSoyyzW
         4phvklj8/cy0Twc49pGrKltxjGGPrjHLL4CApTg9pmi+IAfMmKif2aiZpgZ5s3NuOK5c
         7FqWOo70e6aEfptxGW27AG+sKKPrzXmYd7GB+DwtqDRc8w4pjHF1NDfeISObK1Mr18Gg
         T5xroRcH33aY51duPLNDGReX0mYiW/EZOlxibm2Yv9uQtOi6btqWO/6Quj4D+5dtR7yM
         6RPqUgd865rVQpCSxWYqs7hBPOalPrC8by+6DbMevYPxg+2g2mmnQbSOIG5iVDs2mVhV
         l+Pw==
X-Gm-Message-State: AOJu0YxXZ35590nyxUy7c67LK4HYa1NHDPTA+2Rh8Lnxxj5gf+za8Fd3
	aOCSQwPsXdWuW2CgmK0zqo3k1SusRvypES4rBDPSZ1M+z3ufo1Cx7ZGvktRYQGKF5KmSY0/hvnf
	rhJvhxezQPlvQ8O92T/5tleKUnAu/MsQhECI=
X-Google-Smtp-Source: AGHT+IEFD9MMX8LQ3xasos3Wt2w8c7MG4P9CuqgbPxypc5+vx88w9ipJPyt8d4PKocqWSq1wEoAYYRFGuSpkFX9lmgA=
X-Received: by 2002:a17:906:b791:b0:a31:4e96:f40a with SMTP id
 dt17-20020a170906b79100b00a314e96f40amr33843ejb.26.1706209079153; Thu, 25 Jan
 2024 10:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125103321.2622277-1-ckeepax@opensource.cirrus.com> <20240125103321.2622277-3-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240125103321.2622277-3-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 20:57:23 +0200
Message-ID: <CAHp75Vd6Cv5ho=WZpzMfKCx0SC_64PG-vvA+HDJqMMdPGhqnzg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: cs42l43: Use str_high_low
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linus.walleij@linaro.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 12:33=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Use str_high_low rather than open coding.

str_high_low() (here and in the Subject), but it's up to Linus if he
is not too lazy to fix this himself, it's a minor thing anyway.

--=20
With Best Regards,
Andy Shevchenko

