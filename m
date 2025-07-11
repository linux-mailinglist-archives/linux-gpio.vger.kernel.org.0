Return-Path: <linux-gpio+bounces-23179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056AB02399
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E74723B5C6F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A172F2C7E;
	Fri, 11 Jul 2025 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9ZQpNgQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9382F1FF2
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258410; cv=none; b=hw6IX1Qh8+oMPWL9dbnyxaWW5M3T4krh7wbgE4NuiBL0928Mlp6FeS9J0bgzYvfWRfZyvO7AQHGqnKhz+6PBXtd+aDDtueYN0y5KbbDYzJlEykxD+wc041lCO66VHQlJBeR2ah0ehKBGtFbWvaoG3pcl4lhp8c7a+Uh17Bzx4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258410; c=relaxed/simple;
	bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bB1K9OGBHAhLUzy3OnK1HwT2leYRcr0GIY2RVJVlfvyLjTqekO5TdEF3qR8M+q0Gv78ouz8OHc6f/5rQYbsONo7AOWkVQFeHjKN5+DXqYArfTEVBJ8pkSY9Pj4wQnzluDr682JzMKOC2icMb8PQtzGPGb6MVlbsl205ZgTj6qWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9ZQpNgQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso2745136e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258406; x=1752863206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
        b=J9ZQpNgQAtAbEjB0+/XpvKMHMa5y2yOfDmprEzkl0/qsPH3CfQrTAXr6Np7Xb870j9
         zREf516urqki4bA8vb9SJzJv1fRnnOG6pNnzCSL/Ff84DmLRdBY5f20VBz5/2xptMo9J
         jLPhH4OjJkuqhfVSK+AJylqH4zptq0mzbEzD1MuWtpel4evb6mn9X8Rv2rEXZzwwmY6k
         7gesmyTAqPaSCnP+KL/9s7vTUnQhuWXe/GiVa9u5dZg7C2KCrxnNi3U4KhIDXknnhOZv
         FCMT1V3WuBdMIt24NvEcNtr+tOW7qUQiVBpz7QMRFYYlb538QozqmKm3Jf0QKUHWEGMv
         gVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258406; x=1752863206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
        b=aHvOdayd/HA7fl4JFQYRVlthjKGmKmM4KzO2YJgdHmVIEb99CqVLzf2a4qbdz2JP4N
         lcBZx+/vxqtrvdKk8ll+f4rwvG/WypW2mey75+HJcHAG2rgXPdE1OstsLHOnWBMoZLT3
         S1OgmbTX0r8IRZevg7UV2moic5tXmjrSRDKU+zIE6iKXVopp+hH7kYJk0ANdt3sS9HPg
         IhAzclw0QYAEFk0u+4BdbXsKYlNr8LN4J16Hhwkdc5GuPgScl/GQEOmDPW4LFi9vufbi
         kxXZwISw5QXNSBmR9DKXLQthv8bYTbSc+7qPGZpcvPcnujJbnB19v0FBf3ZPPJvUFYMZ
         wnYA==
X-Forwarded-Encrypted: i=1; AJvYcCVoV/TzRyXfFAdkn65GPlGD0ZlrmS3o++5GTtuIHVOe0yWP69XuIPatfHlf0ou1BavnJ7e0IvHKhsSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxko85gsHSFJBhFxtmWJtvQ1SleClY2txnIqsXNB96o1zdzFFIx
	7D79EQsyBwuDMTSI+Uj6Gn0eEdcH7UsFjRlBkzCgzfR2WBq8C2AZ4Caj6kosChMUFlUNzQOpTpK
	fov/iqgEjE7uJd0xkUzAQ34sJqsDzjVBFYLgbCbRmBw==
X-Gm-Gg: ASbGncuxmGbuhlYubGgIGx9qjX96Crpl/xLnnbXrys1myWFwqwCoXPS2h5p6WhpY6rD
	MKygIgoe9aoaLQnTa7ctrNmTEdsOOojrVe0kfFOpq7ohyGQoD24LQ9Qu+IBAkOJM9+I+BkcpMjU
	hOt+cR1ZcEG9Qe1AgVKc43jMee5kVviTNRZYXM8QdGZifXz9/uDh63ETULmncIOY5ZLgU3mmBvT
	QbI5R4=
X-Google-Smtp-Source: AGHT+IG/MoMOERMcdwRe0u2MCnKNH5c6G0Ju9EQCtJSlh1jp+ka6aa2/4j15Ntd51i+P9QmOojm9ELTDBk2mPF4JmWM=
X-Received: by 2002:a05:6512:3a89:b0:553:2ee0:7728 with SMTP id
 2adb3069b0e04-55a043e9350mr1420176e87.0.1752258405544; Fri, 11 Jul 2025
 11:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
In-Reply-To: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:26:34 +0200
X-Gm-Features: Ac12FXzxbq3zhEMygG1ywvm57ienmlxEOsz-4IQUAfbc1IiUJliLFPebYAlPvr8
Message-ID: <CACRpkda8+veE-qQdQf=LMFO_URiUAiFvkc2QCbJBQizqyg37Eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl driver for Milos (SM7635)
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:56=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Document and add the pinctrl driver for the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Patches applied! Good work on this Luca.

Yours,
Linus Walleij

