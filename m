Return-Path: <linux-gpio+bounces-20368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB2ABE682
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 23:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21A94C46BB
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD2925F985;
	Tue, 20 May 2025 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXw/Yf72"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324925CC57
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777898; cv=none; b=Ce7rZsDu431+51mZOAXkCVGvJUb6Pmn1aTMKd6GTY6xkhuS04tyCob0JMpXQ9QsUejS1XzsYRXjcx6wJAwB84NrNZlbsIhhjMLBPjmct4uSKqHq7WXIrsyvbY58DmbnqrWnv+jOmoNIwC4xJLFfnQm0utAXm67ESXgFsqYWG67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777898; c=relaxed/simple;
	bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOfoEtjE8yI1dD/dTXCCRX15IoMKfSQX3m1NZj/QSUCdssPEs4s0DkXRyqdDW+b68RZtKazwzLs+7i0cAjP0IN/+B7ZxR8Jylw40zxlCMSSv3rT2J3/8mYDFQh73htgvcs9GCPhk8tX45bN7JRXuX7dlxCOO6mkWxVd3drzQ3go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXw/Yf72; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so7197213e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 14:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777895; x=1748382695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
        b=FXw/Yf72g7a74IPmLa1HqP5jfDCwtqWp0soi1BrQ3jMWWddiV7RBpz2SuJ3xbyxluo
         KVx4/EqWCHGmwVRUhBve/ImRB5kuDgZfGZTnMe8wjphzs8kfcbJQDlDyFnZ4HbvM3ufb
         TSjOqF2g1XyVvkRoZbFVXLIxZyfK5EMJZTTqgdlduW2PjbMOYKqAGvq880h3gTMXD4XV
         sCuqNU7DSnhXqAae8pau/YESqQ8ZvzZODuECyf3nuab3+g5RuE83v1vkkDTQ7OZpMiTV
         OabPszn3pY0UzpivCSWzfrzIxqfffoOC7OiVsP0HN3b49Gu7GEePsMIXMVIIaE5ZpVyF
         y1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777895; x=1748382695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
        b=iOilsm40fCQaPVBxY2mFoPSGs8M16NuJCJyGOITJ1HsMUFsg8LRBQnJNg3HbouudSR
         nfs/i5MEFDHp5Ic12FC10saFOutQR0KiyNN5N9bhvlq647to3QV8Wtk4JQALo8LcEdgm
         GzTCWgkaaKiq9Kf7QI0WAdc6cvTZJKzL0FRrXA6RiR3FZ+xNT1woSqFQs8nDqSeX+uNQ
         Tmm/oom72lHiA9bqgIdWG7Llulhn94C6qv2i+V/MHwI0zCnL7YYmJfyuGDNIdcadm9IR
         BoN31YQHYA1p+acSKjlIM+Wx3mz6LxHAGjotaS4sY5gsRfuZhoT3x+gXE4E7NswAKGDZ
         QPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaBImHEV+XtwQup+7ZmAhdvRf7+cFpW18E3h/2KdljI/Q3mvolLw1eTNLEgCZ5PnoFz7PYI4xYhaDd@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEHUK8CNzp8iAUl8MbhTEXYSfdXHm5aejB0kprrVqgQKBUi7i
	bOyUAjteikicoXqHUuCn+7CVBHYp47c0Mn5H7qa1H3WEO+n74JFg95HQ9bbcUjHVMRk3igx1dtp
	vxI7Xp8hkXwHg6lGYr8X3T+9evfK5dZbFG65mgppZPQ==
X-Gm-Gg: ASbGncsU6k40peKyos5X0aYk8MXfoL+Blbnfi/u3nUxNgzuiPTkAVWPfA71q0ivK4U3
	2AXCTkEh/iFxxmdjE7MJ2G5sl3/OOqiJZhjEoUwa5hJTldWeyM93gCDWDSidJ3BHeBY5ucHdl47
	Befh2VTDfWD3m22qi/3koETvoWWQ17F4UA
X-Google-Smtp-Source: AGHT+IFVkq4h2CinjfVO4g88kIBTXBbAWFl5Mto0qgQ5kuq3Zs33wt1FkBPYSfQEYVpZKmi9mKF3laDdRT+6Oo5QVNI=
X-Received: by 2002:a05:6512:6081:b0:550:e648:182a with SMTP id
 2adb3069b0e04-550e7248117mr5466218e87.55.1747777894769; Tue, 20 May 2025
 14:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516100423.1685732-1-ping.bai@nxp.com>
In-Reply-To: <20250516100423.1685732-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:51:23 +0200
X-Gm-Features: AX0GCFstJNfbhxP8OvAOpZb2VTNEUaus21faETIiRrX0PcV1DOJb07Ynai4P9Vs
Message-ID: <CACRpkdbXfNs8a+YEwsxROpUT16S9m7NxYXnTsOJNpi3ds0wKDg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 12:02=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:

> The i.MX943 System Manager (SM) firmware supports the System Control
> Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
> The base offset for the i.MX943 IOMUXC Daisy input register differs from
> that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
> i.MX943.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would merge it... but you also need a patch adding fsl,imx94 to
Documentation/devicetree/bindings/arm/fsl.yaml
do you not?

Yours,
Linus Walleij

