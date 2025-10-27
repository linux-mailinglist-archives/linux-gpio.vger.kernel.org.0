Return-Path: <linux-gpio+bounces-27730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F63C11A06
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5848A4F0C0D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C73324B30;
	Mon, 27 Oct 2025 22:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSoM4J4R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB62F99BE
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603065; cv=none; b=nZvwjBV1HugSX3lQiPOEDUcY4YYSXakSjkYoC+s298xlELg4oQnzItvzJINhgs32L6yOcYeb01YJh+XrZuwXORE7LFYVI+LzdiWzLk364S7MdM/WrJPfwOjWv3RJRq2DVUH0JyA5KEHXj2uPIfD5zETWY18u3QAj7e3Cg1LwcFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603065; c=relaxed/simple;
	bh=v9H38XxmVOscTdAXBIMgyb10vFFsNxVOxLuwwMxDzMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dB4i7LPHmpkWJfNuaz/XPBZhdOehie4PBk0DgGCqZk1wBQKAqqkPPkVQcV25moGBs4dnK/hl1c6GRYfFOMT28T83EGHwEhCGWEJpo9u319fSD0uv50kGXfOZXsw5T2mNUHKxhNk6iMrS3IrkPXT1JR+fP2S126KzqcofvGZHTek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSoM4J4R; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-378d54f657fso62267141fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603061; x=1762207861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9H38XxmVOscTdAXBIMgyb10vFFsNxVOxLuwwMxDzMg=;
        b=xSoM4J4RpfdRV/WtHwRQcV2fC0k4PmVf2cXIk9Lnd6oGbNYeBoCxBIFYiuXwUrhKrJ
         iMspsjtzu4jFF2tLOGjB4zKmL+MfgKL7HUifLb3Z+tdl6CeXeCIZDbI4HL36mwB1L8rp
         cKDqcTXan3XGTpVADqw7+MqNXxaYR9kwsUwp/n06zRZtBWszcUzVuGDVuMpmm5Gxcg9b
         rV5j5AFJWPOeTFGhLGNxJx2E2wg91ALFCsc+KmY47LfwWOIyhJpsKIJHlmq2X6STRbwP
         ZMPl16OPrm1StX4rupCtU8GM7r6zK7YfpcgDtFxZDpAkhrtO2hZoHidSbUtabtm2sfmG
         FLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603061; x=1762207861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9H38XxmVOscTdAXBIMgyb10vFFsNxVOxLuwwMxDzMg=;
        b=hCDElzSu/e1U4Eb/jMhdRgW/PgAJpSuKRpCJ7OHBlB5jXzO05/2k0xpm/toyYk419d
         tv5nUKB9XmektQHw9OMEzOV/a/7p2Qx2QjpCaqA3mQIWLe7I67Ld2FfQRr6DNSw0nHqu
         1+rv/uZ7aKfw6D+nJ0gzyM+HYYeSl4isF1cag/SPWgJ7QzZ48eMItBLirgG31d+00MRX
         7LewTtsAFROpI7RahRetulREb4peH19eBsarRRyWe+pCuqK0XMxPNqIAgKG0fPtC1ymR
         PsdABnzTUXReNoTcXJ7r/BJj8UtE2yB5MjcI61LG9QEQDV4xvujos6qWi8Q/0gx97RV8
         MY3g==
X-Forwarded-Encrypted: i=1; AJvYcCVg9fKJdCPIBWKAPV1w+I0sJLQTF58B17ZR9yrX4Tv3Et/+7VQkYlQMb357CH3s0GoH/lm+4rrXmOr8@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwpGMYOyKEKE3t3i8EkygikHftP7vewi7YsyC3BUTeeDJcAPr
	aR1jTd73m5WNn096JGhY7ZBlbgqWphIeH25H6pxZL3veqX4d4dFIMCvlytUmaIaFRQBbmPcYJLc
	TufqNbQCumxeI9KneFDTIS5Ejalw1uVH9a3g2AsZXKN3aTAlb4MuC
X-Gm-Gg: ASbGncvnvCWuJTuvJVYz9srHBJjhq30QVq+96AJ/VgjSFUZJVfcnU5uqXAnEt+X+lCV
	fb43tXWj+qzAHo4J3QMWHkX5BIHVj5V08Kq3KEqEsRdcZWvtnNUjLNlR9MnoLrnbWidaZ4QL5qO
	kbfmOcEupW5o+UaI0kHbbyTXY4KmzAFBhcjITQPKY0b+H3XEo8a43VUccmwyb+4s23Fw9R7N+zQ
	occF467NP+rrZFlWexSQtrhiRl1amwd+OyaT/f7IL9Ric2VvCJ/39wIqNjt
X-Google-Smtp-Source: AGHT+IE3B73ELbUQavOS3+9V8O99ObkxGs1XUoqNSIUdKZBsD2NXFZZaX5rjgwqiz7ABPv8TjN+usn9RpujxaCi3agw=
X-Received: by 2002:a2e:bd89:0:b0:378:e097:e195 with SMTP id
 38308e7fff4ca-3790775a094mr3319331fa.33.1761603061549; Mon, 27 Oct 2025
 15:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-4-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-4-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:10:50 +0100
X-Gm-Features: AWmQ_bln6fs42YRtiqP8ik_NX7rcLNvMO96ITfFJr8FlYTKtoHQT9TbJlFukMl8
Message-ID: <CACRpkdZETuUGn47foo49xhj5krfE42sJ09vYf7EuKzm7J7kfUg@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] pinctrl: pinconf-generic: Add properties 'skew-delay-{in,out}put-ps'
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
> to the generic parameters used for parsing DT files. This allows to
> specify the independent skew delay value for the two directions.
> This enables drivers that use the generic pin configuration to get
> the value passed through these new properties.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

