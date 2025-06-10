Return-Path: <linux-gpio+bounces-21167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C83AD3593
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C5C17619B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130C028DF4C;
	Tue, 10 Jun 2025 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I2Cr7Xjc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE928DF10
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557225; cv=none; b=oRo3Odp2JR0kJ1FFhp0cAPk78oHem/8QN1gQAtDeMKrE94en1XvSIFB1BBbnCQ/V4WOqOPGji7RayzMxMNdosMoWDaoJAZbvmpoJxt+G4a8C7OJpGp9tBPh+Ile6D1khGrUy9cA99bf5D+F8/gVILEWu+vOdMhLZ43/6ZWxr0aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557225; c=relaxed/simple;
	bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTYv8ec++uhe28Cg7/u3sD1ELgBl7okw2nzqqghmfyy/altucHCmz7HWrNlX/WL1VyPAps92tWuMNhylSDSHYVw8VyeONyiJjC9DB6621rrFLGZBpno7oEW1J4k7pNDBl43a8pJaUwVn5kJADepiKVY72pzKlBnYQ3XXcwEvk1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I2Cr7Xjc; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32a9e5b6395so49812701fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557222; x=1750162022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
        b=I2Cr7XjcL6Qqwdyyk8lEcpav4v4NYbibMuKkuNCyWCLV2vwu8n6d+Lp/wRLAoCAFb4
         f8S3onkfwz/AZ/YLNKxTxdSqPGITGRNfO0mNQcwTsqni5VsTD/3LjoOCD+HFdRT7Db3q
         aN+ZVgwlQh1Kh00vXlGrgvZjtMRdWdAFKgTdk5Bf9xfdZX+jRcehCoEDw0vMqeo7vnV7
         fex+mmoZUVsI5lkqDCV5eYxkLtT/S3FiX/TwedMUvsMNWrASwQim2BiAKNChrZ1APfKz
         CCSbUdwNC7ZzGOxqZOpJg0enroMSvqJisuGKxogj7zrY+dtSLueDsqRPvjUiYPQhI3CF
         JgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557222; x=1750162022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
        b=D8NSsV7jVTr++0wVwiCLa1qgJWBb0STYeaIOEupO9T8xi4/8/BsGGDkEVLJTrj1bM6
         4mnrkUmrAxxDRc7204vXqsE06zrgMF8llAxhUO7e1yFm2y8rm2jIzj+TaqjUC3qdx7ST
         GhlnAYh0J/BNnpCqJPREdnQqIqmHKZEcQpt1s0m+F7KX+TlzyvDIlaRRKc3pnZFKCNv0
         KdtLyK4q7/cgVtvQfH6OWVL7MNgimnuOz5/f3dRinuqQD0y7Yr9VczjncvtFVVSaNCPX
         HROmK6aUmsztkWmhgW7PLkBgkzDLPBAATZQy7MkmulzUra8d63HrEyfUHL4l1bj8NOFu
         5bVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxTB/VjlogUoSUlKs8uYchkvLsGWvBTH3i/U+leHdHNIKuKo+MErme4qv5D4bPBgkUkzlFwpIi7Zya@vger.kernel.org
X-Gm-Message-State: AOJu0YwwELjPHCHeNDfmPy5GtExiHaxalp+axKEesO8AC8Nl8ctSMf+g
	3ET7sP29EFu2ouSQNxz2Oxf8b1UvNfTqd/DzlZXXlWENPD047LhgxbQ6vjfozfWWb/lqezdvDkW
	B4jMxtDd9fJQgNH8z9oWtLzEuROv1d4oF5YfqExVm3Q==
X-Gm-Gg: ASbGncuZrD48F5KIGQcwfoqw8QhEZq9apwZ8ysslK4HXQNy7/hAtnS8kbSDnseCuX98
	6H+dNDYld6idbB+uxTLGMRGzcZUwwywWmyT3DIN+9Sru/2JyNnrymSXPzIdCz8CjecjXC8RZj0v
	l16aGsZKYBRrccXD0EE7AOTBxEvf1BnJWQBm/HRRpQL6hfPtpUZzMIvA==
X-Google-Smtp-Source: AGHT+IEqz0WMqtI0x3GGlKwfWemlBSbd12UaQPMKKY+qV7hhxbjKafYK8sYr8Wg2JEL7ScFpC5Ui0NiE4JM2Acs5Gg8=
X-Received: by 2002:a05:651c:220d:b0:32a:ee4e:56ad with SMTP id
 38308e7fff4ca-32b1533b1aemr8972041fa.33.1749557222298; Tue, 10 Jun 2025
 05:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:06:50 +0200
X-Gm-Features: AX0GCFuHU7ZhdHSe32gs089Kj2im6LDUCERAjIX60g6Meb5i30AmFDVd_Qjjj2o
Message-ID: <CACRpkdaGMiNwBAa60hFzsboV3JCj=sWVz-NKah=eNk+vVnUHVw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:43=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

> This patch series introduces support for the MT8189 pinctrl driver, inclu=
de
> the driver implementation, new binding document and pinctrl header file.

Cathy will you rebase & resend this patch set based on v6.16-rc1?

I think the code is ready as long as the device tree bindings get finalized=
.

Yours,
Linus Walleij

