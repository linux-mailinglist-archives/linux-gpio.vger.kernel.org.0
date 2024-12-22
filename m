Return-Path: <linux-gpio+bounces-14130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B995B9FA4DC
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 09:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3371A166E07
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 08:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A431885BE;
	Sun, 22 Dec 2024 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlE8zbwj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9C17D346
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734857619; cv=none; b=pWkaf4WEJv9r8/wOPNqYT1WwlGX0904V7D/4R6+Uz++jLuRDj1bDltYU6lmwxS+xkyp6Dgvhg95se/dXFpBazrdv3sIJNMmIHFz5Yf15bJ7FLaCahbeT/SNkWaHAA/HF/i7MLYFh5QaYsnijxf5W06V/UcmaGYtdDBUIawFgNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734857619; c=relaxed/simple;
	bh=uy+9LyTXsAY/BQBuiIUA8MsV1hOwn7563EKaKnc5erA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvrOf7jYCYX9sh5Oj0hydCpnbqYz8seSNch0QJ6zNbpYA+iC0Q/SNh+4U52Mj/q/d+wX5C8ZrG5Z7Fw5KTjeOzoEv8cUEPWASWudnRTqHjSdjXh6/M3HXizNj0+QEOEL+LehS1/nDjAMRk9kqWx5Oc36mhJmo3gYntbSdSnoohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlE8zbwj; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30039432861so34899281fa.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 00:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734857616; x=1735462416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqkNDF2+OAIBEt+vZBkgAIYRzlhyLbCcweDvqsNrSNs=;
        b=xlE8zbwjWPL3gIvYfJ/bAjikzb+oU+iMHqTS+Lz3aT0gxBJGGLb4kALawXODPCVkYx
         mluIS4oAnO5MzNbArwWjssOnFxbOR08FRpBsulimFd3PzYDltCZS13HKnP23VRIz9oMi
         L+bwxlYppNCAp2y2FHFB+HkKDrnRIJr8/14MbixEuIBEi0KfZ7MOzbPc1FCDBFLR9ccv
         qp7OGyxtgi2z8lhvFzQ/P9P5iDIvtdZnVeANoTuellW3D4ny6yOCbeOYCT+VMhmkxawm
         SlpFsTcn9pNtI97a568X4nlWksAo6DGc2rNi13X6pz7e2toFVu7VOWxTuiBVUzaQrGhJ
         ED5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734857616; x=1735462416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqkNDF2+OAIBEt+vZBkgAIYRzlhyLbCcweDvqsNrSNs=;
        b=Wc2lBBCfuqPcWAnGRBkwRbXppZjWcBBI6E0oICzR/ZXkLl6c7ltMtfb8U8EMr9daiE
         mxwBKOHgfWMOUWuRpGc+b1Zk1FXuAuXi4wKQcluuxPRToEqE9aY25poZEahge0nV2+Cy
         baMGzifJej+KkTlg7j0Z0I06wAAKdl28YNUdFQJdN6/9EYxiH8QNHYEGqG9Qz/GqFF+Y
         UJWDXNQEoft/ilLDKGWdnqZ7OkOd9UtOFncb4VUBoBBGDoSoh6sH91CwrJjILaAg60H5
         x+hLlHDBnSY1blnQ2zxSZ83J6W3gd6CjBvKF7y6y1dPe+W/4Xxt9kFNiTx1PI3DB2TCH
         hWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtMdigTPtU+3NOQy/1P7vgo0Ii79492gtQWU4E4/T5mWQeGi5+d+aUJnmLT/d60JND5tOtzZrl5P3m@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtxzqs/vxO/ZNZFUtecnS+3v9qwReXTrPSozmWS2zZ6aO3IXE
	DTn6TMWMzov+8C+g2y4d0rpJx+YqDlf0eZsqjEgl+N77Ktp8cNIPdFJnnkBpRUmwm2cBGceShG3
	h2k9p94LlE1qfM/E8362WRqcVoKeiDnpVWIuRdg==
X-Gm-Gg: ASbGncvb1cb184Toz9vljaz8lDqlyL4cs52gnKY/zEkUA3Go2fwExIJEvO7+iuHmJf0
	1b+izAh0IBIkaqgdUycAiapu7zTUD8cKv6TQW
X-Google-Smtp-Source: AGHT+IFVBFNKlsL8myP7J0bvsTo2nQeXxkAQfvBy72BMFyzv1dJd92Z01I4khkW9NjBLKbw1ibbqU7DjCC0Zb/rjtWw=
X-Received: by 2002:a05:6512:3b90:b0:53e:36c8:6e54 with SMTP id
 2adb3069b0e04-54229582067mr2654686e87.42.1734857615997; Sun, 22 Dec 2024
 00:53:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Dec 2024 09:53:25 +0100
Message-ID: <CACRpkdYrmZBC+wm62brjPtArFhxcnNY2=sw+8jHiyproh-kPtQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Correct the number of GPIOs in gpio-ranges for
 QCS615 and QCS8300
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jingyi Wang <quic_jingyw@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lijuan,

thanks for your patches!

On Thu, Dec 19, 2024 at 9:00=E2=80=AFAM Lijuan Gao <quic_lijuang@quicinc.co=
m> wrote:

> The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
> through the GPIO framework. It is expected to be wired to the reset pin
> of the primary UFS memory so that the UFS driver can toggle it.
>
> The UFS_RESET pin is exported as GPIOs in addtion to the real GPIOs. The
> QCS615 TLMM pin controller has GPIOs 0-122, so correct the gpio-rangs to
> 124. The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
> gpio-rangs to 134.
(...)
> Lijuan Gao (6):
>       dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs=
615
>       dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs=
8300
>       pinctrl: qcom: correct the ngpios entry for QCS615
>       pinctrl: qcom: correct the ngpios entry for QCS8300

I'm planning to apply these 4 after v3 arrives with the collected ACKs etc.

Yours,
Linus Walleij

