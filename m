Return-Path: <linux-gpio+bounces-27831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B30C1B301
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA5274657CA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE57B2C028D;
	Wed, 29 Oct 2025 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfwd39Cw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0BC1EF09D
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744462; cv=none; b=I23wqIiszFpp08sEWaVQSGOuIoUPKFXs/dxxz3BcregGtpTgJxitIyisdWnGss/TOW65XgrtlzRebYzUd7XQXTkYuYVk8mpXNWbripKqEAetUVvyjAS44vbuZ151U8ojHtNkwc+U3TaX7ldJHRL7o7efvi9T9GeTHtJoDy0q5Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744462; c=relaxed/simple;
	bh=4jQlm4QL0G/HlPu6AaqVyYXrKj03YxyBn06mrBxHybg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcFsSpQXr+uRsAI0sgUrOKq7N+GxT7dr56w80kbSJwZTQKH44RPHhmoFdq/Zg1a+xsNArzII7+h8Uo/YWJNy30EQFLIsr18nEipIvk2bpLxZ28iwM7Sgdr6m7ofkmPhnHhYagSpqNbKqboF1twBd9pcQJfquCiWPLgQ6hP/Ba3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfwd39Cw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-592fb5d644bso7328077e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761744459; x=1762349259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jQlm4QL0G/HlPu6AaqVyYXrKj03YxyBn06mrBxHybg=;
        b=zfwd39CwqfnA3m/tPDkDdoBU6TkYek2sWsR8NAlNhxIC7QNbq7wi6vgWLzylLiE3uB
         mk9E9tBXFxH5R7Xdl9SAdCxXK3PMbrcgakY2epD6frjbn9rtRcAQEUSoS9EDNhk/OjDj
         kNPoRSgNt9BJnpMNAOTz8raqmznKBu7DlDPDm25L6XveXjngUUIuBjVzUGQJW8/1eh60
         eHTH5jK9Qmkmz8+xyTQKaeovTtxhCQT2u4qLipjq3RsVPbpX7EvB4Ug+oJ/Z3fb/ccs5
         RKBe9KFJyb3aKGNUTXbggu1dslr7QkO+Zm0oZ1LVU6vv18tMs8P1HUjc11IOyzj9Gttn
         AoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744459; x=1762349259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jQlm4QL0G/HlPu6AaqVyYXrKj03YxyBn06mrBxHybg=;
        b=p5jlNFFP2Yi9yxeoIn+5/1Ja840I8nI+YLr13ZHXhivp85JQPvPDFt3RI+k5uK+7iZ
         32DTZnlLPIdljJLKNTchyccY3i+HtnUU+Qo5Hg++dQdEcyacB2zOu+dh0oPBWuvKa/k1
         FHQhmE4wUzp9qLLq48WLyf4aXHeQjpWnJB9LmL/382G9304y7s88SB1ee2C+aCHNk0Ut
         AHgcrIsNRa19g/kFsQqvYGnqFitRfQ8BiMMW8f/6E1q3W6DItKAe4I55+jstnqVnUXQO
         3fNbacvTyprvmlBkACJgVQGx528phC2HkqdfCGc5vg8MQqyWFiZFMmJ4w7U+PW0t51ZS
         O2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrRPdIJ7LA71CnX/6EwRKzYL5KINErh7mkOHdAyxIvDRya9ZFYYaYS8pjJhBrkj6p4pZ3QpPxI5u6r@vger.kernel.org
X-Gm-Message-State: AOJu0YycDXSCog9AfAtOna5Ggp88s9L4hoxCft8dFCSnKs+iOkkrpsdv
	bsbYxSPgvBaUVeBr0R40Jqq++U9NfoCQHSQeDpj+YNG+L/8nSPsB17AXryCXtYVD1WUD8JOm1Ht
	Q5cHjiiGYlkVecIJjEKNcJPIL4JGD9Cyydd2iHPeh/g==
X-Gm-Gg: ASbGncsqCbAAVX/kuyiQ3xngUkaWFIo/R7g1i15mkThch58X3Tw7T2NO9CXP9wmq9Ty
	SK5pGtZdw+84fJacJm0aOYUgAUQJ3dCLBF58zqWPA8zKMVZBlARPyrv5GqOVz+NIQ1fDq1xJzHI
	kOWa2b/vGDiIm+UohUrNE3/3m9TYYMq5gO1t6n8j2f4GY8c5/AhG9asTIEqCWF2jgC/0JzrWg+y
	r2nWHRCiPOMqpNJNRACY7fS4JSZcG5/NiKaqHbpDzpUn5Mo9DsGJCXNgpyzmGJYXvonLsc=
X-Google-Smtp-Source: AGHT+IHNfCne47Z1eBbRQa58ZTteY04bLS9xhtCisnJoPUShci5UwjCrSgpL8aWwPI1wivqZluOA5wXGysoEwwSDBuM=
X-Received: by 2002:a05:6512:2284:b0:594:155a:a055 with SMTP id
 2adb3069b0e04-594155aa157mr499507e87.43.1761744459075; Wed, 29 Oct 2025
 06:27:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029091138.7995-1-brgl@bgdev.pl>
In-Reply-To: <20251029091138.7995-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 14:27:27 +0100
X-Gm-Features: AWmQ_bkhP4GKHMHamZ9_Sw4YqnmBMd1h4uFCvo1UTXA6q8F0rg4J5dsGaF40x6o
Message-ID: <CACRpkdYxe9A_xtA62zH=7LOKURQZ+vmObhLidzEn4FvYav2CcQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mm-lantiq: update kernel docs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 10:11=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Update kernel docs which are now outdated following the conversion to
> using the modern GPIO provider API.
>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Fixes: 8d0d46da40c8 ("gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h heade=
r from GPIO driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510290348.IpSNHCxr-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

