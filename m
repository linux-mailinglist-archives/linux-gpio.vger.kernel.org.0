Return-Path: <linux-gpio+bounces-27140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43DBDB2E4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 22:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 759DE541688
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 20:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368033054EF;
	Tue, 14 Oct 2025 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mc3xoKx4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3764C30594F
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760472845; cv=none; b=BUsYURJEr6krdh05VHyyBQi5eK5q+OYPEO5pMhvVT5IrSUrJTJYwnAPLXH7ZXMdxdMw7bcDZ/PrdGgHv9YB5WXFVYoe4+iP1KH3WwbZDoabABcLQZhwRAdqFa877RmMZ/2QbkcGxifsldE6QoxM8qLpNJzc23bJpMogezZEZaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760472845; c=relaxed/simple;
	bh=4SjEPEjlWep5gU3J6a93orAuWUCgYWFpGeMwqORKnmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJguMrHAPN6bD1DXjFE4MT/zZc2FOLR2Dzs17ib6RdCLZVbmq+eEKKKLKMRPpd+qvDsl1u9f0gPd0q9em7ShRFxBfVohpQZtG6qBZ+mDfH/tyjRqVMLt4KNDCXuTLlg8uXjeWCqmAw0HVQ0TA8jaqE1kIrNLkDSnRWfZXPVtz5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mc3xoKx4; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3637d6e9923so52501731fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 13:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760472841; x=1761077641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRL7yP55FZsuArjzHnzTt8bkESp9r+xQAl9w62GS3Mk=;
        b=Mc3xoKx4lEehWzQDHoTU+UXsbFg/vtl31qNH64lbPz/u1e/TEmdDATCsVoDH0bOTsa
         9pEJWzCs+UOgeRmMjQOFC9/APu8+If1m4tnVpF73SnE2/Ik9OAvYz3Z1aqKjeEW5pcni
         K/1S26gIwSihR0YvJ01vr69j3OSEHQ57qiw5xu8HNvMCU8h5wRn6X9hMO1nrR4+qt2pa
         yPa6YpUIxjHiBpErq7e+XzGCyrKL5QyN4b+1iKMu3vCaNCI60nkW9gFH0kHCtk3fCpNe
         afzz2Bb4V/WSYbyd8Dn/x9I8nBopQiCcdwCI56w8BySF2fIyD7mSHB/zjrCYPbqs6oCU
         +/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760472841; x=1761077641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRL7yP55FZsuArjzHnzTt8bkESp9r+xQAl9w62GS3Mk=;
        b=W6q0/DWXEGumWGr7cjkCaZ6C6ZgFUt6ZlCuqIvLHZVub01eckLCg/XKza4jXkdOzZI
         YLKLzaobk4a4Pfhq+cU2kxuXQLcwEdGpqg3tDpSuIo1/rtODrNYopBI0ED6jMRgeO0Z3
         XUNOdXuwU6isvxyzP8l73oDcRBoQ3tSba8on13ActiM1e8bnn67jRu2zKbpmWQBMXM+A
         3N/gY34oX+hUOIGuli3IB9ye34lYs0jjjO4mTtET16GKacW7bJhSVcQDkDBeuoQ/YQXD
         Ys1MY9MtKghh5L2YCgbr7NkpuLRzcx7xwExPK2xjqgQ4lk4JT3awo0LvFBXGelRvWSdY
         w8og==
X-Forwarded-Encrypted: i=1; AJvYcCWOE6JHF9YOBHt9kxbxuBqCek3EZigAJ9mO2s9BH0izNvbY74LpJlJYVcJZ9IN8Q3evSZQwS8YsaaLV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+XAWcdViXcvv0/C+93bMWN/DQM1monhjtk7PBfzMSnrEn51ve
	S4ryNVvQhfpgyyhPlfUZVZHvSvUrsAs4jrxCWDNatm1OqdIi0rwaD/ZbkNyeYsAkF+pL1JYqmWN
	EUSyuMOGIxu8jelaQxVs/EgC3lmxSpAqUsi0XSfq6jA==
X-Gm-Gg: ASbGncufpVENcZmOWEpeLEosx8v3IZ/mow5FqDqMdM/LIF6EpHgTjJdCEUYoz4LlVBD
	8iSsRLtGRsrrkmD4cBvWK6yggwde2L06gKioCSW79JV4K33XWCri+ahT7epN8ZXnn/v27g8y0Z+
	i5nTu4bAeSXMBKj5ROLB8I3L5+AF9kXuj5ZLTqICidlnoHV7f0rluU78bTQWDG9N4UtpG2Vld0X
	JQWiSf/ciX9GKTrtj/FBMgbrzczVlb8Bc7NLtOp
X-Google-Smtp-Source: AGHT+IG+c/RQZD+0BVP0nLHNcQQpCHhF3SSDuV5EMqiXVv1DgN4Em2i5iNrVkDIsVxWl80rtbzj95RlgyVMuiFXBe08=
X-Received: by 2002:a05:651c:4344:10b0:376:3b32:ad9c with SMTP id
 38308e7fff4ca-3763b32b732mr39537411fa.23.1760472841322; Tue, 14 Oct 2025
 13:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922152640.154092-1-herve.codina@bootlin.com>
 <20250922152640.154092-8-herve.codina@bootlin.com> <CACRpkdZPURiag1cUQZ319_QA83u+qOCSRALxpe10_+cTcevy+Q@mail.gmail.com>
 <20251001174205.71a08017@bootlin.com> <CACRpkdZ1qg6ecA5DyVEGUHQxLh0SnC=GC5JZdevT99YVWU0ypA@mail.gmail.com>
 <aO5ekPxeg7tdFlHi@shikoro>
In-Reply-To: <aO5ekPxeg7tdFlHi@shikoro>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 22:13:50 +0200
X-Gm-Features: AS18NWASZOxDjvevo6edLy771RxyP0LAmvYlJlH8qS2O9u5M72Qx7DPeuUj90bc
Message-ID: <CACRpkdacJCp8aCCrCAzD5F=_K3g25t_8kZGzaEoXMBnhY8hkzA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 4:30=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Because the HW design kind of suggests it, I'd think. The GPIO
> controller is a standard Synopsis one ("snps,dw-apb-gpio") without any
> extras. The GPIOMUX (which is extra) is according to the docs part of
> the system controller with a dedicated set of registers. Luckily,
> self-contained and not mangled with other functionality.

Aha I see. If this is so tightly coupled with the Synopsis
designware GPIO then it should be mentioned in the commit
I guess. Also:

config RZN1_IRQMUX
       bool "Renesas RZ/N1 GPIO IRQ multiplexer support" if COMPILE_TEST

+      depends on GPIO_DWAPB || COMPILE_TEST

?

I understand that it is convenient to make this a separate driver.

I'm not sure it is the right thing to do, but it's no a hill I want to
die on so if everyone else thinks I'm wrong, I can just shut up
about it, it's not like this driver is a big obstacle or anything.

Yours,
Linus Walleij

