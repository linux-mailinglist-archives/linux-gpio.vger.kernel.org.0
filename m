Return-Path: <linux-gpio+bounces-27014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA13BD2885
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C7D64EFA35
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E592FF155;
	Mon, 13 Oct 2025 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fz2c4lHa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD42FF141
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350859; cv=none; b=TSAecI0a/jMnf5ybN55qhly8ZdxyKUPb8UGn78+e64g2k+H8hosODdo24GZC+PIZrCVPf03Rnt97WJLpTakUjwZ0flHIwuxQRevUFYEDyKOA0FSgM0gQrQmh8grBbB1BklqWeOcULaRfDjjhG92py48Rts3KzG28Qa5RqSJS5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350859; c=relaxed/simple;
	bh=fcU2hvtiqOtEJL5DakbifgKs3PKbbo/P/l9WB2Vxgmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QObX1FtXGvpsei5y/q53/WapMRpp0iuM+Teqk0nFmE0wt17/+/9GFNX7XDhCSXfrucm4B3+UNCA7zI8zB5NX0JSxbaSkJ+6Cs2txKH5DxQaee2qbkEVyFguSq1W3mB1GSOB6zZFrZ85r7rvx4HqzVwjU+h4RwNhMNYrBBPN7+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fz2c4lHa; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5092419e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350855; x=1760955655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcU2hvtiqOtEJL5DakbifgKs3PKbbo/P/l9WB2Vxgmw=;
        b=Fz2c4lHawMhML302WcaxTdmKakCyxrcgU71KG18zCt2xVZVQgKmgf+5vIjvgLBfDuG
         qX0yxy9yJKJlbSlMiIhz8EaWm8r+CzeLUwUIiCRwAyOeIsOUQNeffXEVotzBqsBWRCsT
         Vsze7zA4qijnrT/TcW3llTSsSAsFGALmE4Crw/v7iUGCTTBJ4VVuZWJa8WGUQgQ5bfuy
         Ic2YN2K56ftmCOSrgFAu+Pszt93hwgkakVt21PNc5mArC++DYy2YDmmJFXF94hwd7cWk
         6teGYCIFz1rCnpeGomOCDMSQNWyS74MHiYByUWrpTsC1H9Hrkol3aYp9x+H9Gli4Zb3N
         Y8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350855; x=1760955655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcU2hvtiqOtEJL5DakbifgKs3PKbbo/P/l9WB2Vxgmw=;
        b=vo9YaT/E/epGaPpFUj5NUeqyrAG32NofrKRu5i/weACan41E3BZbQ/fZ2WOlyawFY2
         Qo5DgHln2JlK2Jk9WVTEfT7ANiJoos+hs1L3HT2CqquSl9NeV9QGo4KFPdnx5GaiupZn
         kJHIyyQv3L4eF9btfcS6XoxPMP03KoMHVHGyFH3h2cT4aUftCrclt5Ju4ZQ7zlUg1qn2
         5NU073Atmy24GWqRrcW5QMB5S7trXnrRdKKGX9mnFbaESvscJ/NL3sL2q22tumrx1TPj
         79lbeeeoiDhVtKTRxbBeFG20qz+Yfn4Ajv4Y7BhqR1ZZ1rNNNXecPCWW3P+kdSapBasc
         8NJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXazKYq3IKibm7XTvJYupEGQKhnLtRiBvKg1WnCf3swkQ3zKDNHofhSEEVN0EI6JPZ7Oisr/4NooG8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qcvU4UtC+z8PL2TNEXPptR7rIIJKi6ck8c7v+5XcCmZ118NL
	fqYF9VtR8+Khf/NjLxdmGmT57BvtHbYVQAGiS0qw/kioIzjqn0enpJvR9jU4f9n2ztAyNqPPjte
	M7Lpy4CDZYUztr6n8fJENqDYYwGJukCafrdG8QU4FQQ==
X-Gm-Gg: ASbGncsr4GS9HZqJzAusqBHyxzH1RUgxqp/8wy8l/twQCROjd3BInG7A6/SCgDeU/FD
	py/T9V1msH7DmudNn1VUxj7FY4XiyYRnW0/C5kBHbbL+efknQ8BPiAvWi34gQrO6cdog5ljOIF7
	LlIXAsdUqZRtqhRuOQu1tHO4xexAnxrCOV4P3L+xr5x5V+JGg+UkimBVdaRPofDo3AbHgPqrjxE
	BsVeN/YAtTbFMQXPRbq0ZQDf0oD+0VKDS9jvuQe
X-Google-Smtp-Source: AGHT+IE++Os0fqy/yAdlOz9d4PkLf+Ls3GL9g7Q3/yU3hmM5XrfEXc8t6zWUa5j0eDtIzoB0htW5M0TX+JNvYxihyhc=
X-Received: by 2002:a2e:9fcb:0:b0:372:9505:725b with SMTP id
 38308e7fff4ca-37609e4618dmr53758041fa.34.1760350855219; Mon, 13 Oct 2025
 03:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:20:44 +0200
X-Gm-Features: AS18NWAZSnNIZfjSNsmIQeFXxWAey48VNVaVOsP1_d-0RO6HcJ_1-u8sQfmWEbo
Message-ID: <CACRpkdaU3Y778=Fnb1K2fAqAZhuAYrCuchF_+FuHpLR9o=UNEg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: Update dt-binding and driver to support
 Glymur PMICs
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamal,

thanks for your patch!

On Wed, Sep 24, 2025 at 7:01=E2=80=AFPM Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:

> This series contains patches to update the PINCTRL drivers
> and device tree bindings needed to support the new GPIO types
> for PMICs present on boards with Qualcomm's next-generation
> compute SoC - Glymur.
>
> Device tree changes are not included in this series and will
> be posted separately after the official announcement of the
> Glymur SoC.
>
> Changes in v2:
> - Split into two series: SPMI and PINCTRL(this series)
> - Included the DT bindings in this series, previously posted separately.
> - Link to v1: https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-dr=
iver-v1-0-23df93b7818a@oss.qualcomm.com/
>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Patches applied for v6.19.

Yours,
Linus Walleij

