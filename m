Return-Path: <linux-gpio+bounces-18811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7364A89587
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83F717E18C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139F427A937;
	Tue, 15 Apr 2025 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZDqylIl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A392741D9
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703159; cv=none; b=GsaFgvFYFP9i1qNzrGiTLnhZxoYwn+GPpLGZN9PjUAx6KehOMe4OETY/JfoTu5HzJd3RW0tMlqfKbA/czDgepANRh2ueL6+mFrMCvOoRBN3705VZVgyUl8CzUy4X3bHncp6Ubjn4gXEoXT8HSvPhhyGVonwdHHoX/BJxF1odaRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703159; c=relaxed/simple;
	bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIq5C3h1UFZnuCTbYa/bZECRsi63kQfmlkgIKb14tJ+DB/C75AyHowni3FjShzUwtvvZl0cQU91qyKDIPcnXRyyX1mPmnNOsK4g8uq4l8yPzwP60Pw8TokbfU81l5kW6Zoos1/ohIMZlxzGvb1VYKtuWfFatv0ztdcqZqWnAoEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZDqylIl; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfed67e08so51239411fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703156; x=1745307956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
        b=RZDqylIlZXJoUVTaghOc1+OwiEUCyMTIrA9r43a42X8hrVy0+aIontnsAB2jUIG14X
         WiA6pSri7TdnG8NtAbUK6Q/yS9MOquNBkYL5VOfcAORnz1gv0WaCHddcf/8sPQWYnd/H
         Cut7DCyb6i2HinLXitaI4StYo6bo24MEc5nPfQfz+ofKvV9E9cY8vdr4lxBmx1pTrR5G
         ACGU8YWTqgO3Ah8GMLm71KyM6cqtCWWvCorr7rbBVBWLXyJya9LDEGqUTWRdGT7n1EyR
         Gcu+H8IDd6M2Hg3iw1D2X4Qf13lf3Sx/FAA1OGAFjmsq7YJki+gFL1pemgFUdH5qBClj
         +H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703156; x=1745307956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
        b=KHwhGkG3dCArWP9H7ZoZcZDgql2eJ1e/d1d09zrxrbcW9ro8deYLioumOM4HSm+d5C
         4sxxNbY3zu3UWnT/TFg/t9FuCOc8PTIkTb6yX1upvgGoo5sbyFB0NynNGQweWtMCHAAt
         N1t+90NcPQGi8yMKsGO2Xb0Tfzsy2xCcPK4OtxouoCKvG9RI1VeraiUeXEDrUTiboMVn
         3T/3h56DCLTPtHwy71cpW/1GRfWazbGx9FsEkMM9K1XR/j2BENR3Uloja0AZ7Wx2cp7E
         DWtzCe4p2ZyPUXbRzNWu2WOhYWZpkjcy58CXpfhFpZzTmkplllOPw4Q5mvGpNFIkShGT
         iFmA==
X-Forwarded-Encrypted: i=1; AJvYcCUSHg+9u0ANo2kkcU1kneI/6inNxVoQAvWbsfH94xzZPXMQranrNbnW/RZ+M0dZoZgJIJZjJKBMIpk0@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMl07UZke2yn3AKIULaGv+l4GHDHV0SbYJ5S4BxFghH/5YCSZ
	0PcyLgf/0Gnbvgzt9Ug2teJqfuoe1lcngFGvdldO4BuDoOlvh0+jHKLmRqn2n58n9DVFNzg42yG
	XxRk56pq8EqN2aDJRacqc58dzkPQf90hwsERY4DT3lwGEq6tc
X-Gm-Gg: ASbGnctsEcnRg3WYVmJJtCgX08jZ4tK7gjmwCFPvg10wkg+BWKyq8v6Goqgvs0f2ng+
	w1j8qchVZpFkPBj63j3RSCAkbZiEE0RmnqDoxcGZmWWANubxbSlFhnb5ztybC7ksvsZIpjPJPCT
	g2aaHhCL7E9JCeedJ2Vs0K9w==
X-Google-Smtp-Source: AGHT+IFwAAfaAAzhBH2j7GeY25vZiQ/zwPAChqOV+UPITlwOewIZwKKaiN+msHLAb3VJXQqUL+3/Bv4el3h6PxyLHRE=
X-Received: by 2002:a2e:ab0c:0:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-31049509fd6mr47883131fa.0.1744703156150; Tue, 15 Apr 2025
 00:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:45:45 +0200
X-Gm-Features: ATxdqUH5lAyNEtt8NGqYFFPuzudR5N372Pir1OcHVfPuTb8kB94RThH28hJgscw
Message-ID: <CACRpkdajcn9XCy1L=EKEodTQRnaWqe3zdD4+dmt7rBoKS_n=Bw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix the invalid conditions
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 3:45=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> The variable count_reg_names is defined as an int type and cannot be
> directly compared to an unsigned int. To resolve this issue,
> first verify the correctness of count_reg_names.
>
> https://lore.kernel.org/all/5ae93d42e4c4e70fb33bf35dcc37caebf324c8d3.came=
l@mediatek.com/T/
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

