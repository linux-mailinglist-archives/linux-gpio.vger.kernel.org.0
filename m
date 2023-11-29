Return-Path: <linux-gpio+bounces-687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D57FDA8F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B03281C208F7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4779C34CEC;
	Wed, 29 Nov 2023 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aZT8slYs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37190D6C
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:56:17 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54b18dbf148so6236147a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1701269775; x=1701874575; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0w8sJtJNe2IFo+5hrLPBLvXQAClmsdeJBw/l2nW104w=;
        b=aZT8slYsbXPfZY3WPMsOz5lRFOZjmHHG7Ilgpc1fnw1/LdWAkMPG8APO5OL+1QQLI/
         PckV1qC74bpQ88v6sxwdOcieExvAN2OvGrYhLBpa8UjN4nRIgdr9OtLsD/CDKv5hCdOd
         qv2571loHJcsTt8Bs4RT1BFmAncKIdCzXlP1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269775; x=1701874575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0w8sJtJNe2IFo+5hrLPBLvXQAClmsdeJBw/l2nW104w=;
        b=BjRY8gH6rDudFc7y7fNvZRIfJggN1jmtcqOpxh7rT1DD2VW8ZJwoZUf+zsINv/QCom
         HwoGot3plVCS1tJqtB6lIBai+mwLjVEauIF0vnd2sTZLKzp7WyyhOUQo7fS4DShOcOg4
         8lEmmcTxH4jDkzrZPhrJXDRA0mT+YFXsCyrkfBF4cSrhvLyx6TxGDJPgrJEnxftG7f5U
         NndolFKDWpeFZW06GXRUdoOUezW1jUumS9oqnOziixHcSBAw1PorxSzdU1rYRmJ4NyCI
         id2FnKzReycVbW49pOgEkhgAkqoMqXe8jGjOieU0t0LyZ/QHucjh6DQwZaK5nm8SdEaA
         Nmdw==
X-Gm-Message-State: AOJu0Yw9EAsqhG8/MxXQe/6QtLaPpZFVdD4o3TTLLeOUlU1ykCvU3JBo
	a8l2yNAoazEu8SY4ANBBaRVZ3VaXfKiONoWqkqYQcKWr
X-Google-Smtp-Source: AGHT+IEwHZDcaSMVJPBNuxAioFib1yf1OL859Cbf73T8h5a1co5MDF0QewDoyjIdQaZQH+sgDAX3KA==
X-Received: by 2002:a05:6402:17d0:b0:54b:bd76:103b with SMTP id s16-20020a05640217d000b0054bbd76103bmr2822403edy.4.1701269775380;
        Wed, 29 Nov 2023 06:56:15 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402014300b00543b2d6f88asm7400802edu.15.2023.11.29.06.56.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 06:56:14 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54a945861c6so9375679a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:56:14 -0800 (PST)
X-Received: by 2002:a05:6402:483:b0:54b:5b14:e77e with SMTP id
 k3-20020a056402048300b0054b5b14e77emr7070909edv.21.1701269773930; Wed, 29 Nov
 2023 06:56:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
In-Reply-To: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Nov 2023 06:55:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=whk4oNQazgpzkujc2=ntVQMhU5ko7Canp2Uuq6CpyGzmA@mail.gmail.com>
Message-ID: <CAHk-=whk4oNQazgpzkujc2=ntVQMhU5ko7Canp2Uuq6CpyGzmA@mail.gmail.com>
Subject: Re: [GIT PULL] Pin control fixes for v6.7
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Maria Yu <quic_aiquny@quicinc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Chester Lin <clin@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Nov 2023 at 04:09, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The most interesting patch is the list iterator fix in the core by Maria
> Yu, it took a while for me to realize what was going on there.

That commit message still doesn't explain what the problem was.

Why is p->state volatile there? It seems to be a serious locking bug
if p->state can randomly change there, and the READ_ONCE() looks like
a "this hides the problem" rather than an actual real fix.

                   Linus

