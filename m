Return-Path: <linux-gpio+bounces-11156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 351759991FC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 21:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08A7282762
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 19:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B2E1CDFC2;
	Thu, 10 Oct 2024 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEoXIubN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B619CD1B
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728587650; cv=none; b=FND21LeHcCAaJiOjvcuBmywu/H/ImXpDUacfASfsYQ97oIUxvxtTwIzQrcsMezg1sFa27L45/gNHtZbU/c9qMTsIGGab0Qt2zfetlFdTRglPC6JDgVjkJXE6JreexmPoN4pMQTyTTJQ+2LaoO+4h1GORr1EC8mptq9w8jV219U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728587650; c=relaxed/simple;
	bh=lBkM62Uf8D8hipuH2exP+YuvyI6m5at/29z+OU9H0so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iByZ0TdpXAhnNux7LN6YfrB0T+o76MfGZHc/qU3ikCZ6GviuEHtpoY6gX4FUoHjuXaNFTcZWZYgMy3NCuedQBhvkwByyE74a+1/ULgFxTeVrWcx+YI0ksscN2ejXNtRTqC43nHVINO7/L9R3A1LnBodQngJffAcmT3qsAukhWN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEoXIubN; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so12395721fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728587646; x=1729192446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBkM62Uf8D8hipuH2exP+YuvyI6m5at/29z+OU9H0so=;
        b=iEoXIubNWA/00BR6qgdlM6a6CuWLlOjndTB58zlrHD9cPDSkWWGVkwJq4RK04x1pH+
         VB8RxVP4+Mcq/gqvnVJ9MumW9B7AtZJXAKkACuCmMn11dcPktE0JpwZhI6nHGM5DPj/8
         JaHNsV6ewop7NU7HKT04V4WspLcP+R8hkKdMEaAib9pG6B7RdtzLmNJehBC5xBmWN70H
         7YTYaoXEf7ixkX3p4bb6C1qDhPyJibnPrw5ytjg2chQYcD/J0vywotA1/6ioQhFa+gN5
         rSxBnpoQ3d2XNxDvU/bHNDP5ZcqFKlQYHKJZFxffwnYZuk503MDaNPolKIbVOAIk5ctP
         YLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728587646; x=1729192446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBkM62Uf8D8hipuH2exP+YuvyI6m5at/29z+OU9H0so=;
        b=md3mLZB/xzwddL6AQV5jwlmWI+45vDc2GBlYyJyxnxPnP+ilkjNwTUwjY0pZ8AjvXI
         MoqB+5fFhjSVPlxuM4e5WupkWoZudZdNeNxLtCpdku2pDSmsiYaVyLqlu6vfSguz2+l5
         Z03MFZggzGCf6LfCnMIrjdEBfpEEv3otzSG6Rd5m0OSbznplQEw7Fh+RHKZE5QfuG9tF
         mEHwhm/hi/cePJ4g2wW8mRG3rXbAHYQFnkiD+sKuTUq4vqtbrvTKOeMak1TewPd8ADlg
         1VLloUeDSy0fXl/S7pafk1dVNKCgVYee06XD9yWWU7arS30bL/T2XNqmqbNewOulf7/4
         SlTA==
X-Forwarded-Encrypted: i=1; AJvYcCW+J3mEdxX2ARo53aCfM+OyA+AOJzQDz8HBXsa7mYYEOctuo0b2P6kbciVJ+JqQhmkxjwHnewieC5Hh@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9qH+Klote1D3F/aoRUsAiKQbFo42LXvbDK0vMLt/C02CQpkG
	8mfhbEm9O5Ur7a04w5e3SGzLt20fyO3g5AMn+XSXBG8mMa/KwaOHSXWc4PvbYvFraMxvEsi2V+/
	PDIwzaHbC2hnu675KhqJ5lGX/27loajlPXX0E7Q==
X-Google-Smtp-Source: AGHT+IGYOggXOh9XepD9Y//uWBU8LvHdBKPWy+BsszcaeSthF4pIcJDZgS3LzuK0LgzQT8i472E+9VsKzKw5ReDQJE0=
X-Received: by 2002:a2e:b8ce:0:b0:2fa:be5c:8ae8 with SMTP id
 38308e7fff4ca-2fb2f482b65mr2900631fa.41.1728587645756; Thu, 10 Oct 2024
 12:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Oct 2024 21:13:54 +0200
Message-ID: <CACRpkdZgA=+ZOq+shF4pWcGZ95=Kj5pxBtvywpGc_kkYWVgqMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sophgo: fix double free in cv1800_pctrl_dt_node_to_map()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 1:24=E2=80=AFPM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:

> 'map' is allocated using devm_* which takes care of freeing the allocated
> data, but in error paths there is a call to pinctrl_utils_free_map()
> which also does kfree(map) which leads to a double free.
>
> Use kcalloc() instead of devm_kcalloc() as freeing is manually handled.
>
> Fixes: a29d8e93e710 ("pinctrl: sophgo: add support for CV1800B SoC")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Patch applied for fixes!

Yours,
Linus Walleij

