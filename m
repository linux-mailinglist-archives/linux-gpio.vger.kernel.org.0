Return-Path: <linux-gpio+bounces-952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D971802F6C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCAC1280E71
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0281DFE8;
	Mon,  4 Dec 2023 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNrznMQZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C49B3
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:57:26 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5cbcfdeaff3so49950497b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683845; x=1702288645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyeYb+ql0SyNyhyMLosDv4p5iiN7RVdysjk96TvPY/U=;
        b=VNrznMQZQXMwLXSN68X9g5/OdxpIohRK+oNslgHvKEP/xEBwGB7Y8aA4ftrOWHhzLv
         CBj+C1vCGSO+LuYnvysjMY5SPehZXTq+RKMg3ieGrZPxonIy26dbh5OTdrfas3x/l3y0
         tXk0fBMMJcQihEQNoyFpf4141mLrbx2CJu0LfyEpHl0oKnaOI8qJ9rFPzpu/CJRSvDdI
         ZBS8678B9S8ezq4LzEE/ro3yEaiGssVVF4KHMSISDCq+Sjw9jmxJmmBU8CkQSl3dr9XF
         R6orJ4atECtlChdpljU8XVcgpBKm7SZKBTUXPpnA3OdVcMa+e90bqvGhyUgwQOGgUvfi
         2oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683845; x=1702288645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyeYb+ql0SyNyhyMLosDv4p5iiN7RVdysjk96TvPY/U=;
        b=K0vGrGtfq55NkqeFqjxF29m52ioqrhQwyAIfURspmzyyWZO0YftTDKMfQtnpbNOcPS
         UKmPhAnpg/LR9oEOIQlfYVjn4Gh8CtWFNXelzI2iyrb0e2gAY+ftHzanoMN7I01BDw+C
         V5A2+UK3vcGy9+ivHkKssna1+ZJVtaMXoN9Cv0tn7F9QM/Nu7ntV/XIE7+4M8Q55aBEo
         Xq9KJ5VFZA8SaJzye6JPPyQlyw4vSPiXd+RoRPyOLn9SEEVbOEL10x4tA69WMkAuuJ/l
         1bOELkUzQIYY7MTO5N6COgvlJC5XD9ZNwVUHzShLPdNNb84lLz0w+PYGydIjZeloy8HA
         EhEQ==
X-Gm-Message-State: AOJu0YwKlJ1AAzqkNWKqDnY5uMe6PX04BSmC7iFJnrvlSU97VrbDdS63
	ugRnzzvQAeiUyIeK4zs3UH1LSuCxrWwCVNCZy5Z3ibmXKiZA9Zns
X-Google-Smtp-Source: AGHT+IFPNuK+9cOIpKHmoinczKV8MminI3NreBuRG+6sy+RGo1WH4QD56pTWpN4kexe3XakI3kZkEOgDB4+bi46jBIc=
X-Received: by 2002:a81:b626:0:b0:5d7:1940:f3db with SMTP id
 u38-20020a81b626000000b005d71940f3dbmr3037866ywh.67.1701683845464; Mon, 04
 Dec 2023 01:57:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
 <20231130024046.25938-5-quic_tengfan@quicinc.com> <dx62durg3wmqviqdpecdqprd5wwkg4i7n5tgcab55axzssdeel@ftt35c6td2sh>
In-Reply-To: <dx62durg3wmqviqdpecdqprd5wwkg4i7n5tgcab55axzssdeel@ftt35c6td2sh>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 10:57:14 +0100
Message-ID: <CACRpkdZRNvUY0rEY__v9wPy4bjuDSgFhEkXFHxixdfyKSw56Bg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: sm4450: correct incorrect address offset
To: Bjorn Andersson <andersson@kernel.org>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:33=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
> On Thu, Nov 30, 2023 at 10:40:46AM +0800, Tengfei Fan wrote:
> > The address offset of 0x100000 is already provided in SM4450 DTSI, so
> > subtract 0x100000 from the offset which used by ufs and sdc.
> >
>
> As Konrad points out, please fix the broken patch, don't add a separate
> fix in the same series.
>
> > Suggested-by: Can Guo <quic_cang@quicinc.com>
>
> We unfortunately don't have a way to give credit to those providing
> review feedback, so omit this when fixing patch #2.

Just write in the commit message that Can Guo helped out in reviewing
the driver (just some free text).

Yours,
Linus Walleij

