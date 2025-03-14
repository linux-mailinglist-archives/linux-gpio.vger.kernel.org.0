Return-Path: <linux-gpio+bounces-17597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B198A60E27
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28EB7189E9B1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4481F3B94;
	Fri, 14 Mar 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fRFz+CVT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDDC1DF982
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946670; cv=none; b=SXS6AFOeBKR/pUm6tnqvdr0lbKsPURaDCNCkvILXRcH5Pj6caKHYfJIQMWmHgfJM8as2irxr79TIcRl9cRFcQdH6ZyqDQCxqNLC69e6Pg1nQPT/MzI8yNn/PDTky+rYplRGmgLkMK1Bfod4P03OQ30nSHCu080RE0TQ3DTsWxE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946670; c=relaxed/simple;
	bh=HrE09mKedOk9fo3MpK0rYjDRK3jK5wC9NgMIu9SSbyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsYOf7HQlNVViNDMdmq747urzgdt5/MIXRKKqWxxfHD+8INUlGLij7ydNFgdCfzS9nN2h039eJ0rnx6vBjDSDgLR9eWmD0c2LiWnDGfj88h2yxqEk7Rh7aBzrKPHyUbaRxG2jH3RNbVUrqme5qEyBysaWc53TyfpPFWyxIwpico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fRFz+CVT; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfca745c7so18222641fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946666; x=1742551466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrE09mKedOk9fo3MpK0rYjDRK3jK5wC9NgMIu9SSbyI=;
        b=fRFz+CVTQzcXSawwdIUbuElv9csN3dJzClHpjYLb3w4lsLtSB9c/zhswXlQOmhVd7e
         xBPENOMhpDOeMvEYDK2Oru5gLih8Fz6iGgCF/fVGKSTQ8iOZYaEk+vNBH4vEaIR4L3LH
         HcjTYvssraNPJ8G36kw/RVUscSMN7jO47FP1nQAcVDOBXQLRboWd2i7p934TsaeNOuAP
         rbzWVmDPJaYbSB+/VGn6X128UcJopmKrhls18ensxLsvxGXhOPcfJcXtNa1bPdF+KHrK
         hOIiQjXl7kHKgq4OdiIU9YwoBq+J9U6FESgqHRnxshlk4qNxGy8eRiC6IrSyw2Y5rgJM
         6Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946666; x=1742551466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrE09mKedOk9fo3MpK0rYjDRK3jK5wC9NgMIu9SSbyI=;
        b=rOxG9GkUw+HyV4rubxIaJRryAMizIYmCCQGOUEdafJxDozyBNWDPvGP4VUm7eJA82F
         WvsYJh7i0o1IcczUPOHHNYkTTc8Iw4nqGb27oSvkL7X4eSLmsCOPti5DLtsDEQvo3Q+O
         FRPtjW9mJzC6XyWrQezksDasxPBTMtiSPsFJgXyLjT0bPyGLTpQ/5DFXah7PihyBtGgA
         pUpwwBCq/O8l9F1aZ8+0fSCdJjkEUJO1dnk8P0Zerg6pCXlf1Gpl4jszi2zInIEc6IH+
         EfKgj94jmhXtVeO2YVEtmF4/aIXODyZfHtwj4L68kUj/mQe6dD11WSt6rTOJwTfij6i9
         7GFA==
X-Forwarded-Encrypted: i=1; AJvYcCW+aSrEY3GvPMMy0/BWQfWrzQlVwyv8icE8Q/J/eQUKM+vGQWdY5iLCjlpIodCJb6V0Ky0NC31yxOzz@vger.kernel.org
X-Gm-Message-State: AOJu0YzrKyzEHqVYF8v5WQtu4gBqyQGOCHQil9vVzFT1wNNWbY2g6xJc
	nUCJFhuvX9zPhsuXE5nZm7vJHPAW37iruDOoJrivx/kteoHcAtX8g5SqaBKZyjmttaFuM9aOipd
	ioRRZO9wJgJv7p+ulC2/51hE9M0vj5JhXCXTOSg==
X-Gm-Gg: ASbGnct4/mbVal16Fy+6HgKrqE6fVtXwPU0RaT4mIh88w1PXd/Mg7ebsUS0nWTBaelc
	Ngg8CM5OpIFROZ3uO2zJ255fanc951opngrOExUkQ/C8mpfRg4FDl3ntrvhW33W7F5IpVbAYnkz
	N/qvt8YqHWqbWIcMSvwbCNsnc=
X-Google-Smtp-Source: AGHT+IGgoI83vSiToX3Ab2Md4G9QTPt2uvDlfvIFor3poPeFCoQq/Et8/x3cJtVhEho87JFB+bRoP0HoW39vS4Eny+4=
X-Received: by 2002:a05:6512:1386:b0:549:66d8:a1f3 with SMTP id
 2adb3069b0e04-549c39610d3mr518455e87.40.1741946665777; Fri, 14 Mar 2025
 03:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305104939.15168-1-pshete@nvidia.com>
In-Reply-To: <20250305104939.15168-1-pshete@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:04:14 +0100
X-Gm-Features: AQ5f1JoOEe7T9gHagqVccCbtiE4HvkyR3XLHW6KSzkjBygNKsQbkExvz7sXEKJw
Message-ID: <CACRpkdb_c5nfS-WsQdOViYw7nHQo7CfDkcSiVho7=Ufh15i9yg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: tegra: Add descriptions for SoC data fields
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:50=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> Add detailed descriptions for the remaining fields in the
> tegra_pinctrl_soc_data structure. This improves code documentation
> and clarifies the purpose of each field, particularly for the
> pin-specific configuration options.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Both patches applied!

Yours,
Linus Walleij

