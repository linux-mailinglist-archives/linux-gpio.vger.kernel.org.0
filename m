Return-Path: <linux-gpio+bounces-10798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C3398F152
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 16:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6ECCB22600
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 14:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D63E19E973;
	Thu,  3 Oct 2024 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DY67YH40"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E818858A
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727965397; cv=none; b=RT+O8+w5CtYAN2Cj8Idyn9oR+Aw0MAL9GYqmyHe7KKMfuK/620bpSs2Nf/iUg+pKiWf6KVOYzh3pX1zr8wyVNm73ZTDYiNBIZMe7Nqigw701BMYWVS1kC7AeWvJ1nZB10TiFq95iN8vl+UXOy5/8Rz3+yCzyN7HJDhDSqi+sZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727965397; c=relaxed/simple;
	bh=dAjex3br5LGI/C7OLyif4ht2N7fpXhcmDxX+rYqm3rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUOTp/dvdnCRqPxth4ASwUrqCEdGC91T0iBrr/osarwtuINulJpzefaux6XrJTtjrg+uOxJnZnhur0WoomVb6RU95COnfBsVZ4Of8cVZ+cbPe+XiGxskl/3pEgWRDyK12g9gOgOLaqOp7RejfYsxzMQhGYQbGk3RuK6VAJemEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DY67YH40; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2faccccbca7so10128871fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 07:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727965394; x=1728570194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAjex3br5LGI/C7OLyif4ht2N7fpXhcmDxX+rYqm3rM=;
        b=DY67YH40ZFe6+Gjk3l1Zmhx7aKwdRpBZuMuPrEmjlUv3S7LUTKstmkE1bVe4vOkrO4
         3sPtz5DCgNVEdmajVVwFSZ8J3yVhfvAOjW0aJKISNX7Ycll61516pvZsqflIQreQp3PJ
         KtksBBDMZFzizGCLccUPlbxu1gp1MK1McHwuw43DN4wP1rwDf2rUebRHjYhvHUK8HsRD
         yZyxBgLcXs7n5EhG7PZtzpbtESdHM3p7wjLisjQXzy9hIwELnlme98EDihg/4dUZRlQB
         g5PziTzuQw0wZxfVyvmnG55CjJjKXhTekxJXMWLIg82C1mQ5iJtw8UuWJ+9a0GdWZFPA
         eo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965394; x=1728570194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAjex3br5LGI/C7OLyif4ht2N7fpXhcmDxX+rYqm3rM=;
        b=jxZfX4VONHGpwViudYhBMPiwaxFPfWNZLd4Qb0tscMcSdhLVUNBYIYTYRLBIAxUnUP
         UecSb5valKzLjsrUCuXL2nNjhA+QP/xYApFHO5/N4PM/5KMtyE0GLm8FPLRP54bAxXvF
         o1j7xWkyGUQvBjeIUc9Cq9caA7CzzD24pwzX8fOXXqmXDbgt8d7/YyE1syetdKUvAtrj
         i6uK1m7PSc5miLt0ldrfibFS3boqqPgcALFisjFjmeZyZFRrNflehMl60Wv4yLUmM1Qg
         zbY4hKGCU7TNkIM78SJ+TNaRpxNb+kdhoCOzaLBHhPkva5OF6Ui1rebXsuuOUliDpQXc
         L4ww==
X-Forwarded-Encrypted: i=1; AJvYcCXo1xrTdKVY+O3gHql78S4OkLP0anSeBdReuoOTbsSqXJnZMzCaA0tcMIeV1l67ymXCmd8cjKf5YJhS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5SIXtBA+fxSrLPilv4TnawuhXV0ttZUIEy2WyDZ9JcU+H7ulL
	Hj+S3LtEb0cmRPj50cdDf5MNT5lu7nKP4PyWYfAKvSnM7uF5wYnSOJ/3Jn+vl2FuTaXDVO9XMCS
	Y2G2Fksry+VOVdwu0R/y6J6KjrTGl3eOOYPYaLw==
X-Google-Smtp-Source: AGHT+IFdip7cwgk4spxBoXMqdcyn6mIZ+Y2LKQntlDxnri37/Ai9RYCDnI6+mmKZGbfnvUn0T4S00ZAMRU8P+OFkQS0=
X-Received: by 2002:a2e:be04:0:b0:2fa:e658:27b4 with SMTP id
 38308e7fff4ca-2fae6586dfamr37063361fa.4.1727965393557; Thu, 03 Oct 2024
 07:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003-imx-pinctrl-compile-test-fix-v1-1-145ca1948cc3@geanix.com>
In-Reply-To: <20241003-imx-pinctrl-compile-test-fix-v1-1-145ca1948cc3@geanix.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Oct 2024 16:23:02 +0200
Message-ID: <CACRpkdbaLzV=7mD5i1PS3Bu5Znc2nV8j06pYSB40k9dWSyBapQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
To: Esben Haabendal <esben@geanix.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 11:23=E2=80=AFAM Esben Haabendal <esben@geanix.com> =
wrote:

> When PINCTRL_IMX_SCU was selected by PINCTRL_IMX8DXL or PINCTRL_IMX8QM
> combined with COMPILE_TEST on a non-arm platforms, the IMX_SCU
> dependency could not be enabled.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410031439.GyTSa0kX-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202410030852.q0Hukplf-lkp@i=
ntel.com/
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Patch applied!

Let's see how much more the robots find! :D

Yours,
Linus Walleij

