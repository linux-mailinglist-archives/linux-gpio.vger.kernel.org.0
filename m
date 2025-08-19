Return-Path: <linux-gpio+bounces-24545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12656B2C2A0
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA223AD13A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F7532C313;
	Tue, 19 Aug 2025 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asGMn7og"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B132C33D
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604943; cv=none; b=XVDAHeIa0MPIRSP9o00kk26NWGrlnngP7V/52n1DDeoTI7rOwjSitFR1z6vX4Fd2gnGjvKydJY6vJkJpR+Xm0+QlGmzFM3K20bh89Hr2+lpOM37VM1MuyznIuHOJxsLqujc2xqcpmU0jJqeOsWbvkatGxCCffmF/MzUzAZCrfi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604943; c=relaxed/simple;
	bh=6TVZrx3yW/3GVfN0JiLDvi8HkyKmD5vQzNInrrNbY80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJ71mM3ChTHZdM8BV06xzM6Tp/w7ojz162ZnPh3VO1CJQUA1lb4vw/yb44eA3jPpR1eEiIkhLyzb0NGwbVGSlDl6QQAgTAgkdAEW1a9VKO0wlrjcdi49+6qEKjN7H5q9N+9idfRforwbj+zn21rMUmurAhMBsPsYFuAlk70tTcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asGMn7og; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-333f8d1ecffso39731641fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755604940; x=1756209740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TVZrx3yW/3GVfN0JiLDvi8HkyKmD5vQzNInrrNbY80=;
        b=asGMn7ogJ16Dq7so1Si3iCYCVZiB7PMLqsXWsbmY4qdpr6p5EJ157gKjTSJ3IuRHYU
         49xxvMz4NGmaRLV3RpFUacJHPcpT53lJFy6FaYl3RYVdfgf2vhatH8o5C+6NptHl8cFn
         v7aS3buwXHjWWbjloTgxq+eKSNQdowYY5XOAwfbsfRNjeXbnO7Jf7BHTZ7ElTv869LaF
         365rzpIlhhG4JD+S+dZcBXQP6L4596F2ILi49jAzx9PhRjjiKvFLi36CGIvrGBpnswIJ
         cZWyLUX7srYwe4YgTjbIDoHInRmK7sqSlN8ITAcyUCRyVjiuACHUiIuYgTYcSFk6eNsy
         lzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604940; x=1756209740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TVZrx3yW/3GVfN0JiLDvi8HkyKmD5vQzNInrrNbY80=;
        b=q9jI+nZ9RlzgRaqTu8fRfshDzh3f4O4Ucp0SQ8i8R8Y4qlxC1r65GAEr5Gt1BqVbKi
         gH4/b/D7npDzGn0ZL4jMIiQge0MH7BTjmmmwKYVI0vaMQqboslPiW9c72dwMJWkztL19
         Te+eswYOqKG99zbcdZKCw1bSEBQrzLnyjJie8XYTWle1VD2iSqz1pnzkobiGRXN085Ho
         XYPbP4TeGsWmwFHT2QlApg3PqnNFRX2O1UXKZLSVYgMrEWCU4NEvT6zeQOYVxvlmKbzZ
         YB+f2HkAFbGRHt6pFCVZsqhMsjUBZ27WS85eQLIK8O1ODqVYRDc+VqP2Bmz1dh4FJU3a
         biQg==
X-Forwarded-Encrypted: i=1; AJvYcCVyiCk94jVSrlI+mCGP5MhihRoN2P7Z/gxiD0Th1BZcVzK73dWt5f7hp8XogbWjFer5hYHXqhx27uRl@vger.kernel.org
X-Gm-Message-State: AOJu0YyZvDwKmaWA3imRFV5VwGpzoHKo7yV4Em1VTKV6yZK+GgFbDmd5
	5cJt0iiSF5zezSV94mqess4owzanEEPw/qbU1BmLD0nBc9NVSk87Jx3sit61WfTX7UYgT9L8zms
	VVqsMvpu2+7jycKBw6J6jEhQvXNaT2Uc6NvMTcUiodg==
X-Gm-Gg: ASbGnctLjp5z2yxqakKonl42SsVOfD8TRxbNv86ulkbUZtQ00jLBbIHDdpTBnADvNq5
	w3aOyKnzVfuXepjf406hHCe+6Mk26W61XpU0daVIaGhEbZxUZJMakFdLxCMJePKtSaGoO69CpDF
	FrjkkqlMH6uTkZbluIwXpRDpTOm0Waka9WH7SjE8QxOnbWeAbsj9NTiq97SQODJqffrz1dBy29W
	9gXwiU=
X-Google-Smtp-Source: AGHT+IGsV0nxIVKmGLU1AbxhgNB7rkNNlCrMxlfSh/p2qSJY/mwbJNKjy1UNUy4ywd4Q0n8jSPBLk4Hgt16QmJ6oP9E=
X-Received: by 2002:a2e:bea3:0:b0:333:f25b:2905 with SMTP id
 38308e7fff4ca-33530721b94mr7284791fa.35.1755604939647; Tue, 19 Aug 2025
 05:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com> <20250813161517.4746-14-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250813161517.4746-14-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:02:07 +0200
X-Gm-Features: Ac12FXwYP7tCmXvvIyV-DdybN_dEgpuebivdGZAlYKXJ4ztPG0Y2kKaouge8baM
Message-ID: <CACRpkdZgmW9MXAKbMxQ9dHz8-Oi8pVCPqnV5OE3FbA4KT+0yQw@mail.gmail.com>
Subject: Re: [PATCH 13/21] pinctrl: remove unneeded 'fast_io' parameter in regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Andrea della Porta <andrea.porta@suse.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 6:16=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch applied, rebased on top of Adrea della Porta's changes
and fixed the two new instances as well.

Yours,
Linus Walleij

