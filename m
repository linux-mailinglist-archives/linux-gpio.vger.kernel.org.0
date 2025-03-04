Return-Path: <linux-gpio+bounces-16990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B53A4D55D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35555171CBE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B391F8918;
	Tue,  4 Mar 2025 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7jbZIFP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA9A1F5617
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074707; cv=none; b=Cog791Xb3cvJpFZgDksutNLwNzEu5SkrRg6DZTUXhcLf5hJUvgv5idKSjOCDgZfGO6GdZDKl2dAn4SRS8Ay7Hvrt0IlEJpKofPbQgVunE7WPO/xen8yglXwVWmq4OfVkhtYfhj9S7Abg/EJp4EAS2fDqv1gPE5lTq22YsG1MAEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074707; c=relaxed/simple;
	bh=u9ZCYhaK23fUJUUt5s7FYrwFuoV7Wm409Bw5a49OPOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LztfcEXDpUNajPYhwviVgKhDupeO7HEKWi4MDh0ZB02E2esWu6ETE4yfvYkzHqR34J4aULLAvQXF5KkM3oJXTfKGOCHkQEssGUxcFowGblLcwcMR1WbJSptHZGRb3PpnZNcLOsWJOfguQN/2swFBdsg1jwzK4wrOCADJU5FfRyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7jbZIFP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5495c63bdc0so3138696e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741074704; x=1741679504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pA6zLWQ+dYJkLtBz+wtBiNsIVYV44LsyhmBHfgcYN+Y=;
        b=X7jbZIFPqI8JAVpRk1d6NEU3kZGfohQ8AM0VeK9OaPWz0+8GMUkLao79JE7gko/6eP
         fsDak7rS4FvpICROy2ti/qV+TZcoFkgFkDpVAuzQv5jFXHzVRfUuVwJ1gmA5m4HVw/B3
         q+gOrNsJCljeCco2lg4gRvgtZKBWWuIRWOeapL1i8sO16+m4kRjWozHN07k4uJ8pJHBz
         VWtQks94MRZwp1tZ5oUYMKQz+bhqh0kJlRyiG2E8J63qxGrb/pjfiYPZHpIfkdkiyepu
         WvoCICCvdZ7tHGUPGzj6bpPS4MRuHQOsUPIIsqLD2YiRflyVvddQ0qw9yxqsrcqs0Jsj
         gliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074704; x=1741679504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pA6zLWQ+dYJkLtBz+wtBiNsIVYV44LsyhmBHfgcYN+Y=;
        b=aji2b8SlHGyUxx6UG7G0AlTsKnxYMptn+I8I8GLlfirGrM3t83aITzMeg2jprsks22
         2yxnNyO7xlgTWy4pCWtV3LRazD8B44/USi2rnDdgYAFUZXKu7TyvXmg3AzJTa7MId0eV
         OWm5/8uf2qc9b5bVDgBE65Is/dtZ/pCE2XFu6L7Dw6Sp0lRtfhsMLMpd6a+lmZtmJBL2
         EKnVb+0sHC6zgqqFsFbQCc+1wzfyp5t4HJ14z26wPFf9WWOeBqXmILIlhYXl6Qvi8trS
         FA6ARV2SJXZl+1YMxcbFaCgdBl3yr9bv8MYOVB+UlcyU3F1UcsqGgwpL6sImnCEHKmeW
         OYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSqfGqnLDWoXmSZMvbQgLln9kqQMwKHgpr5lFRK2OJz9jE6/7DIDoLR8ShlveDwWdbiymmlqrgbiku@vger.kernel.org
X-Gm-Message-State: AOJu0Yy91UXxkd6oW9QN/0xspGqvAE48sjVZ70bVzcXpwZQGl4KI7Otf
	lAxhjjq9vVEpXNWAExHQ0lkE9ZubW9uPQb+2bT95tKgv3nfKFX/AVlJvr+ya91ixoSe9Vu4Oqnr
	uYjzhuCNBDoUR/CXMykxEXRfTVir+l6cWdg6EFg==
X-Gm-Gg: ASbGnctqhpAQD9nilHLxoUg9TAnE3yx39PKeeAxcMKnrMvaI4ZwtyfI/zFDAACvOAN0
	DAt46Kf9aTcNm3GKhuS3qlfdzeDAJr3hjd9vVs8kN5xVt7W6IsUxAVySgDf4QsJcOhAG7XYvfsa
	8tPudjnWfVLdHvM3T1gJgeg9FEmQ==
X-Google-Smtp-Source: AGHT+IF2HnTvgALEagtidtwMTknG9FoykhqBphkMLjIu+urEhq+snaAKQPbxfAEiEdOYOfpEU/z8RIcNqZf0RTZQZA0=
X-Received: by 2002:a05:6512:1292:b0:545:c9d:ef26 with SMTP id
 2adb3069b0e04-5494c34fcd9mr5744703e87.46.1741074704091; Mon, 03 Mar 2025
 23:51:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228064024.3200000-1-jonas@kwiboo.se>
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:51:32 +0100
X-Gm-Features: AQ5f1Jqk33uHsY5UV1F0bE-LoNlIC6DrZiXxoZsYoJWU763-1spk-ecprSEFCuY
Message-ID: <CACRpkdaELuU6XDKacOLsWAF8ncbudJ9Tp0jykAyf-NXRLjoSdw@mail.gmail.com>
Subject: Re: [PATCH 0/7] rockchip: Add support for leds and user button on
 Radxa E20C
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Fri, Feb 28, 2025 at 7:40=E2=80=AFAM Jonas Karlman <jonas@kwiboo.se> wro=
te:

>   dt-bindings: pinctrl: Add pinctrl support for RK3528
>   pinctrl: rockchip: Add support for RK3528

These two patches applied to the pinctrl tree.

Please funnel the rest through the SoC tree, it seems
it should all be able to go in orthogonally.

Yours,
Linus Walleij

