Return-Path: <linux-gpio+bounces-463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 779EF7F6FFD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3273F281C0C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 09:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F2D16432;
	Fri, 24 Nov 2023 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buo0vSZZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B1BD44
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:35:07 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5cc69df1b9aso16228327b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700818506; x=1701423306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SHecEy2reWyVq6gokigk87oNgyZXlFO8Jl47Eo+PHk=;
        b=buo0vSZZ5hj1Jui8YpZAdhxX/XzQPMicygChRbNEkPDy45avRYqRWrc1TrHfQhOPey
         PJ2HXcfvE/jJz7ISsqcP3pCGTPNKfjjJTV8Jsxtt/OqBvSH0mts8q1BccxNkUDCNWaFL
         rWkorTKnbdKB4lqMnqdtkPC9sNC6f3Xf7YnPZVK7boUvZIlcONSD2bX5bz84+F49fTv8
         lteEkkzC3p3aH+JCFU98bliOrBuRPoayVaQt8XAComSYDiYUF44lBvCYMwBdmLERvKKV
         FOMkutOAlWg4xM5YHMzMvrA09lak6S9eWLMWF/4FMVYrnEmUjKshIA5Kr5+ZlQ3ZnTuF
         gzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700818506; x=1701423306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SHecEy2reWyVq6gokigk87oNgyZXlFO8Jl47Eo+PHk=;
        b=mjB17AVn5rgz8ZVPlUbEj8IjiF5B1sWaWaaR7fHX4cXp4FREBiP1SA6RVdNWucBfWN
         JZFRf5ek7J4cj9vRJMsvZfkprmPcb6laUkeanfp0WI8tFonqLUprQ5ET6UW+pPWsBJ0m
         ZtG1o5dyMxJPK3VVEKTnpuEfx4RkWgXB7CWw4Tqhpzlb/ozWCxxh8ejRCl5Wukn92nxC
         oy6jDXu/fYG1QCi4yrqMBO+7R4mzRhPGgTRw9pLHCWginT2WAW+vjslUuyvEVFHdtrBr
         koUhdod4oZrxzQTpTEGR3Be1PF1aFlcu2ppY0H4CE2tvgIMVFFE5GaQmbhSnEf8cMKVJ
         9RYw==
X-Gm-Message-State: AOJu0YxwFn6l0+xaCV6CKRQiLJk5kMPyVMleluMAYDShhzipFx4K4qs7
	V46F/GV+5kVkToJzMPm1p4u+6mVp6UVFsLnbKR2SYzXsE+K7W1bR
X-Google-Smtp-Source: AGHT+IHTnq655PO1TC9AIlExkPFnCObiXs+7CC9ZqZj6DdVgSgoNeNgxfsrG5JakHQ6ZBLG9MPDRP/p+13LbIsix33c=
X-Received: by 2002:a81:728a:0:b0:5ca:d5b9:9da3 with SMTP id
 n132-20020a81728a000000b005cad5b99da3mr1868805ywc.41.1700818506693; Fri, 24
 Nov 2023 01:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116001913.16121-1-clin@suse.com>
In-Reply-To: <20231116001913.16121-1-clin@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:34:55 +0100
Message-ID: <CACRpkdb_1GLcusRbC6RtprDMu=Sxci9e-ew3gKUcsQQRxT65Fw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: s32g2: change a maintainer email address
To: Chester Lin <clin@suse.com>
Cc: Ghennadi.Procopciuc@oss.nxp.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Chester Lin <chester62515@gmail.com>, 
	NXP S32 Linux Team <s32@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 1:19=E2=80=AFAM Chester Lin <clin@suse.com> wrote:

> I am leaving SUSE so the current email address <clin@suse.com> will be
> disabled soon. <chester62515@gmail.com> will be my new address for handli=
ng
> emails, patches and pull requests from upstream and communities.
>
> Cc: Chester Lin <chester62515@gmail.com>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Cc: Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Signed-off-by: Chester Lin <clin@suse.com>

Patch applied.

Yours,
Linus Walleij

