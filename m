Return-Path: <linux-gpio+bounces-27016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0338BD28D0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C50A64EF606
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC9E2FF163;
	Mon, 13 Oct 2025 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnycrD9Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA026D4EE
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351091; cv=none; b=QzccOMyK283/Dq/8txHxv6sQsXM5GngSbCJ9VJaEzqSWSg0Y9xKZgw57wnAtEjZ87DvM0Svc0HweMICspSCCyC+IlSxKZzsxpB1k521KNrlGbBMUSvybhql71AFEl0+HYKxxjBLXeaP5WA6FRd3CttQ+6/vTuSJhNCpmqzWsi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351091; c=relaxed/simple;
	bh=+unRYycP97fv008huF8n6bo0ikkvJYI2Zc7wQSeA3nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWN+FSHhUxG7vP+eBh8VNnmNbOgpoa4NqiS6iGNXpgyqyioFO1LDRt9/jkp7jjkR5Wj7YOtwQ8NsSjQRgQV8LFoszpn5AIirWgW3NKdh+vvdQqYGnOwGBT+MEgAxsjYSfk2NjDYXiV92S/QZHMaDQIWVLiZ0WvxbEtvG8JH8nIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnycrD9Q; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-36ba647ac9fso32002681fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760351088; x=1760955888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+unRYycP97fv008huF8n6bo0ikkvJYI2Zc7wQSeA3nU=;
        b=PnycrD9Qad1YKFd8X1Fdi+B+dQb2/88AAJMxqSdOEyAn89o5Vkb6zBKx4rZK8+SYA7
         l2s5oHfjefOqLMnW41TWJdDaS8KtoTVXqwZUFsi0Ih+x6jXCizfsM3njjDTzrf8Hn4xm
         +zFcy+h2NDXA/DNnvMNVpkZqB3gp0511kfa3K/+iDC6UTCF35SoIscW5voCfrJXOsaW5
         UHhH3ttD2YsQPKHIkOJIRRvJ5V+QnZbK3GEE0VJhm9HtdGTqJ0uX5CMQ3rKMT/QCDT/f
         DhtdIIRbTgImcyvRWPvPL+StstNq3dbIOaFbxqe5/Bh7LsjGEklpQSG5n+ZuTJNTDMND
         vZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760351088; x=1760955888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+unRYycP97fv008huF8n6bo0ikkvJYI2Zc7wQSeA3nU=;
        b=H2Ab7Hl5aHIuRKHq6Bj/or34tNqxcxWYbqmkGPRVt+Z0mSKnxeDIiAg0o+aI3RXbr6
         q8QVNRV3oCvCdCeAQ2OMylj7mj+CC3pyjRrc7GoXtuuclOQULHzmt3mUvhwJ12pCuv1d
         GjHqz0oDFTsFlUD05rWtnoGrq/exmDGgexxseGwoDag+rrXUfDxxo+d3tEdUfi9lOEyi
         lB3dyGyvH5X9m+P3+6I2652HZsiDi01nerqAfbsV2iFMawQE2T1JF/CadT91GAIRdVaJ
         TNWXQIOlW9QELxzkTgxJOSsQ5PuNzCNsPn19vJFoK5RaMCZ0E9JiRZmLz9hajDyn4nzM
         MZaA==
X-Forwarded-Encrypted: i=1; AJvYcCXJq+JMj60p+3lqWbxyVxpOLB4Zp34JBqnYlbdLrslC5LDKbgZpscSknFW1tSuS9sEYZ4N9ZFv3MhTS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr1vnb8Xu1JDNEkB2nE4fyJQ94nyQ87s1+1T63iMw83JOr1IjO
	zw5PP0q8UhRbBwjvfg0qN2OmHjhGkR5tb89ETSJTwqEuSMMdxrluzPnNnlzAFqVSFC0LSrIX/h0
	U0CRg10Pt6bdJaH2o5oBo74AjVFoVIJptuVO+ervZWg==
X-Gm-Gg: ASbGncvEfAkrydLpEFhCRg9p6yXL08dOeYxMu7bUrM/+i+9EpSU4nbNmb8guqOE/+1j
	Q3NwAyeoI2vaghuM5qbZ12Ci0no7tfX1wHGajShHmZ2x49U7hno/dce2dj2CfN9D9+Er77Pyrro
	SqV3gL8ArRplG2k+QJicmBx8mT5kGQkznT0LkRPcQkn9WqN5qTLDFOGOojPriXWFWFMg763JzGq
	7jTFG7JilAMob9tTYAeyD7kB+WLQQ==
X-Google-Smtp-Source: AGHT+IGvGHloV1limtQ0fx79bfGJXQow2XXzmDst8EglcpB9EbNJ8pFYHIXf92/sCJscA5Ld0pw8fuj+myOX2Y7yQHE=
X-Received: by 2002:a05:651c:1ca:b0:36b:8361:15c7 with SMTP id
 38308e7fff4ca-37609ee797dmr50886881fa.42.1760351087667; Mon, 13 Oct 2025
 03:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925221927.2610760-1-robh@kernel.org>
In-Reply-To: <20250925221927.2610760-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:24:36 +0200
X-Gm-Features: AS18NWDB8GoBtqV-UtGzBfY0pqqIxdxK6aWLKDGgXTJxVPFOQb277q1e2UR2gHY
Message-ID: <CACRpkdZH_Q18CHnT9rjhOGUx53L3pKrP6BrPkB0hSV7JB1N44g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert marvell,armada-3710-(sb|nb)-pinctrl
 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 12:19=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the marvell,armada3710-(sb|nb)-pinctrl binding to DT schema
> format. The binding includes the "marvell,armada-3700-xtal-clock"
> subnode which is simple enough to include here.
>
> Mark interrupt-controller/#interrupt-cells as required as the users have
> them and the h/w is either capable of interrupts or not.
>
> As this syscon has 2 register ranges, syscon-common.yaml needs to be
> updated to drop the restriction of 1 register entry.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

