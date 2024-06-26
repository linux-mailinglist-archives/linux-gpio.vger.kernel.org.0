Return-Path: <linux-gpio+bounces-7715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D20E917D6C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC7661F23DCA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76045176FA5;
	Wed, 26 Jun 2024 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ifhg7PWI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD9A176ACB
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396728; cv=none; b=MCCm7bG7Y75iv6q1ptvnWtvqE3BVTHext+SuTZyo8RvcLqI0/Ok/G+tU1J+mmsqOplNB4rGXAwPzh5Sx7kcAewr+mEqiGNS5l7QIwOFT1S+kSabYNvEPYGKBsYleogDGqT8odGu1OFtfdVFmusqn6Aelhzd9YI0fDlVJa5TZ+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396728; c=relaxed/simple;
	bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H75wXacdZ/QEMjAWElKqPF5mhB9NRB38x9+tNcaHBvcriF4tb1CvKTJ+B7cMnMhfgy7MPhsXqjJZiseYY2O0Kc6/LNea5F91RiHZa6YS1UR1aDBejo1tD+i/7PtO1WnFMgILcwWL02Oo8Ph/pjYCCGhlh+sIO2BQ+NLN6MrnVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ifhg7PWI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so6338695e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396724; x=1720001524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
        b=Ifhg7PWIeeV76pTvN+fQBxbIO1djHZsgo/3Tni0Mu/efQl2tKzrIm1IMvK0Xkt71PD
         r5BmAD7v4IO+X/8YdY/G+D7W/ZZjf37CWm67x6vCr/g19HkPGWca9XnikSpJzRfjAmCD
         t7RVMHZD/JHXCfNfD0MMgmIuGic/jGvHXVsCZS8Gv/BLKpUZQc4wVRgIcDx+6LuDb5Y9
         HC7ue3rbdMNRJvoW8H6yPaus2zDE+zoMhSAbwEmJQmOVyVkt9iBHizYZ6wBvLJL18gyv
         xovg3KsU22ZFdw7XVlEsNcw0lbeiCFC2Myrf4Kl5C6nhZ/kkZh2gg/FiYGbyyhf3Hcdo
         WSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396724; x=1720001524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
        b=q3SncPaNfjrpxz97ShD9cSEN7lo8U3beOHMVv1QsecxuPB+JiYz5SPHsUDeVGis2Gn
         05wAimE38FBBzc4hgjWIxMyocf61jGc27PWQrirZYR49Wi3T8PCWjICdmO4IFR1MwzOt
         Et0mzcsQqRggYhqZSmZbI9QkbvADiCZvWItAmibeMEq2DNgcKJx9rVRdEM0C4W6hHbse
         p4T6+FQ8j9ag9/IJSSdXde/R6zVATWIuEmS3FqQXETB4dsrA5sT/UyWOoK8hlMp9VMTz
         aW4/DFm92HDh8XMIEO8V94Xta5Gch8aUnZETCQQiCF5zmN5Wjde9u/AQStEafzz8uhn1
         fkwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2+PuR6qQqtCIXMcpXpOGMQUaYnYfYjrw6PsO2aqnqSG3aTLZIMj5LsljnhHtBK0KtJwFfSCLh7SG5l6G6Z6+KIGHBD111U0dRRw==
X-Gm-Message-State: AOJu0YyCbgxg5xpKDMs+zIjYEvUC1LMHVi9ZuafQsvYAR17gKcfcqqms
	BYWd9AK0JMw1JPTl/VcBQQt+VwFdu6swR5I8UEgHB+WPFI4rmCDZRVPBH9Uk+pDh95a/qlZa7PC
	bkDAoZDtjPLhJk7cvOYRX5xb/t736EjcNAtbfZg==
X-Google-Smtp-Source: AGHT+IFlHWSye17wo8uw0up94GPccFl/V/sPyPXlvOG615qTQFfaqLTIdJTRIPVYR4dTna0h/ALhLnj/xJOSRpjTkMs=
X-Received: by 2002:a05:6512:3c86:b0:52c:dccd:39aa with SMTP id
 2adb3069b0e04-52ce0646944mr10878848e87.67.1719396723946; Wed, 26 Jun 2024
 03:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620094159.6785-1-wsa+renesas@sang-engineering.com> <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:11:52 +0200
Message-ID: <CACRpkdbaCVoR97YZs7w4T6hg3a_+C__GA-qujdpc-0D8A_UB=w@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This looks good to me and I think it is well worth the time to maintain
it in-kernel.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

