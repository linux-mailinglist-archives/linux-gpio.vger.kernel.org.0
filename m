Return-Path: <linux-gpio+bounces-25742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE7B48E56
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21B921B25C28
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912BA305957;
	Mon,  8 Sep 2025 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xdGfxyrL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9338B303A26
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336214; cv=none; b=Xa1qk1UgC+YovLwkb6tjw4mTYfX5p5c6cHmz+DrAjNKHHQy7Pioesef2iPQOjWGxcOC5aLz9izMdf3dwuC98nPlYyrcISmQjR4c9cq6snZQjc8B4BahUnh72+duZ2e404qgN2ptjpyTzwVexLI9AiAyMCzsVXN+/c0BT6cfimvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336214; c=relaxed/simple;
	bh=i9NEs8V73/3LlyodLKStIRGRG21l4ViD+gJckmHEMhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7YQGQfb8hPwTNPhp8MRC6Kncp5qcKjNs1nzwxgcflW27FYwngnOy4e8fPt8MciaC8OKFda/DZnmbG+1XySOu5G3I4egJkhjKL3avo8a8pw4w+d3CC9HjeWB4sAu/yxpzn/lrJS5dZ7vwcKLOOQlngeyDxQpD/SLJut7d5ZZGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xdGfxyrL; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-336c86796c0so35358721fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336211; x=1757941011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9NEs8V73/3LlyodLKStIRGRG21l4ViD+gJckmHEMhU=;
        b=xdGfxyrLeHAMO3z7zd0IRWxxO7G2ximE/EoZc3i3KhsEDt5xjzy4pII/exmEbaMo/a
         Fcu8BXKB5vOv8xzlpFoIK4yA5efDEKRDV2YJbzOQM8HgQdtupq2vhIzgP10qRkIKc++o
         lTL9tvpgM8jMZGYuQiTYLrx17XyuaXZ51bNK61vLul7JtHq/I5FdUVuXg/pgpDvRG4KN
         ILPPfFaeurch6yEJN6qFGOtcwg8uD9pKUeh3keEW62knWkj4S/qKbCVpwlKEFO10ywdX
         Ipp7THhob7GZzDXa0woyQc+EwqrnhvoJMZmdJX4ceAog8b0W81BHSEs4cOb10Q79QljR
         I5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336211; x=1757941011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9NEs8V73/3LlyodLKStIRGRG21l4ViD+gJckmHEMhU=;
        b=QNQqouDdHB4HFY5uCUqbuBkMAe5JBLYWNfKNRUzb506tiDI35sQAtF9qvvyCrVethb
         CHs4qgZBCdMhfmXdRyC+keCvJT+vooiBtS2GoKVcI6uPBjuk4l3Iy6l+wefLA/hvn+tT
         pp4EtoMSlWj/f8zy2y4z1si8/+s26aPiVk69XftyjMkt5VXyAVugzCdfzwXorgAgJyKj
         zVBVBwU6QUhdbq7HR4IObEY/xNrzyTJsFaYsYZWene0GSbANY7G9xxE6qMCN+aUzVfEN
         uBCpTXNiN1usIdHDOUr7Uv5sMwbA7UOaAVHJzhWR2L394cv1YSFhoLLHiHP2xEG4QKo4
         wc3g==
X-Forwarded-Encrypted: i=1; AJvYcCXhCbQX4AQ8QppCksUWjD12jLvL5T5LA/TWc3EqriiyW9JFXTZbOHfCPYSmnO07s8sMxVrfLDcXy7KV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2h20z2Pmf3H7d0YHMJ/ul93BLtKQHryZZ41yO5RtkZLKUIaT
	z5JfATlnrbzXMG2HzwLV9YppWvThYC0dung+AjuL25wI/y9rPyBJ/0n9ZSyPMGxXBD3s9W/ImrZ
	oOYoW1RgxTGc+aihIgQ5ryKeyjiRER95P3uiHKE2FbQ==
X-Gm-Gg: ASbGncuvPEaedlbfLa0fXmOe+uTICBiMyGwPiliKFlWfkM7jYd/8jYCwBGcu2eHnAEH
	kQqYS5tHZxY4icum8kaLSb/PC/8TfEMNa5LTXATvt3vAaWalcZWEE2LiH5sJ6Y6tvhEDarjwg/T
	oUphd36mWrj2ffWrfuw0UbCu3uy1dYowGEnYAEYiPtFbdyRon4N+OOZuYR+5MeU3CKM+dWArW3z
	Hsg45xersGTgjwV2/Q1c0a0DAqh
X-Google-Smtp-Source: AGHT+IEJ7fijUeRwcBqhdVkGDGPkBaqhhVLbChjEuCa3TFGud0bMeF8EqC3neCfnzC7X5VYOVF0X6+vHRwRYjqQlljM=
X-Received: by 2002:a05:651c:1546:b0:336:c925:550a with SMTP id
 38308e7fff4ca-33b4fe4ac95mr22086341fa.7.1757336210631; Mon, 08 Sep 2025
 05:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-v6_tlmm-v6-0-1720e5080415@oss.qualcomm.com>
In-Reply-To: <20250905-v6_tlmm-v6-0-1720e5080415@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 14:56:39 +0200
X-Gm-Features: Ac12FXxW5YwGL17gaiHO7OUXNyNZGzF4JRK0vQggGezgngIJlttln-n3I4WN2X4
Message-ID: <CACRpkdZsBGejSXT0D69pvwJn8smS8BGDVp_BNaa7KhrHhUrYyg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	rajendra.nayak@oss.qualcomm.com, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 5:11=E2=80=AFPM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for
> Qualcomm's next gen compute SoC - Glymur.
> Device tree changes aren't part of this series and will be posted
> separately after the official announcement of the Glymur SoC

Patches applied!

Yours,
Linus Walleij

