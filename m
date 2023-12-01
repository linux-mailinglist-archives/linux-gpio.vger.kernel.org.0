Return-Path: <linux-gpio+bounces-810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FFF80053B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 09:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC37DB20DF1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 08:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A1418059;
	Fri,  1 Dec 2023 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5MkWUh/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1C710FF
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 00:12:35 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5d3758fdd2eso14912147b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 00:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701418354; x=1702023154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdvsQHdGEAuuclK6zWCzDyAl0EoztStbQelKo58kDz0=;
        b=k5MkWUh/HYplVB1eXHbuR1ugWGogKPBO5ve0En2N63DR5tuaZBdgku+WYxMBn25SOo
         GH7Ng+rokZyOpOPYr0WNp4K5bjPPwjCrAt5neJaEMyY2xHiXdd+tyKGHqzjQwKq2bkaD
         lll04PhM0aTCHATSR93brkbfl08NlEK3boxxAuyagGlZezxTgI/qRZ3jCzhj4YvOorkG
         D7MqJTQtf4xN6o1h/Kl6sR5SWjBFYpr0oyN1651UeCLRf3SzJQmW43VEB7cErMMzFhfP
         ycds+oiFw43uAqt8UN6DsUnKhI+dZ5hiYpFAbEPUMsPEAyedCqZAZrHiqjUMHHQ1pYS8
         vGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701418354; x=1702023154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdvsQHdGEAuuclK6zWCzDyAl0EoztStbQelKo58kDz0=;
        b=xLTdTRDminirLc0eaHT0vPCE9CKy61DhsZcNSO5gpDsjPb03+Tvk5ZcjsK0j9qRqLm
         dRmv4uY0tQBZ6m9d158VCFthki+2wGLaflXrvXtXOd7BU+8P5HKjiamRRqEsTpYCvom0
         DlhNljjfWlbFHZuNjk9clAtBzF+dV4GKWkOm5TIr7e2GhCryh2Jw2DWJc9bhw8U7WdoJ
         XOdoZZTDQASLb0OrXCPGFDyzHmcmnKTZMAa1lRcR1qN/t7ZYMVbRC9g2F/PBhRhrKbWG
         cOHvNjt9WsmN5J5+SYw39CcOXPqv8b8xjvbx2omX5f7r014JMBWbLpY7mhA6CGIoCPyN
         hiBQ==
X-Gm-Message-State: AOJu0Yx3EFpZY2fRqdLjLVSHQj7AdtZwtHbzkqD9HPulvkl768J+Ium0
	5SbLtK9aUMo/bm9A8i69LGfJDpykaXlASXHO9KaUlQ==
X-Google-Smtp-Source: AGHT+IGa5T6HzropwLFep5/pv4O5sxFiHTP5u7bGw9MNJTlkd1MDfLy5QHsnEqIFk0oCja7Ap/Pz6/cjf7dQxlf2zsM=
X-Received: by 2002:a81:ac06:0:b0:5d3:b982:57ae with SMTP id
 k6-20020a81ac06000000b005d3b98257aemr2410625ywh.4.1701418354673; Fri, 01 Dec
 2023 00:12:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
 <CAHk-=whk4oNQazgpzkujc2=ntVQMhU5ko7Canp2Uuq6CpyGzmA@mail.gmail.com>
 <CACRpkdZRf7bNVmJCgsVD0uheD1VLkLKG13d1oS-kbT8BFyRKQw@mail.gmail.com>
 <e703c87e-32b9-4dce-b232-89c0e909c35e@quicinc.com> <CACRpkdZtCxwLZCY4autrTvonmZ3XcVzH6iXqXanS97VKCZ+ERw@mail.gmail.com>
In-Reply-To: <CACRpkdZtCxwLZCY4autrTvonmZ3XcVzH6iXqXanS97VKCZ+ERw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Dec 2023 09:12:23 +0100
Message-ID: <CACRpkdYcPBSp-XGXr=3a+AGOVVVHQoaciSgAUuJS+=3ScGWcSg@mail.gmail.com>
Subject: Re: [GIT PULL] Pin control fixes for v6.7
To: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Chester Lin <clin@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 9:10=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> Hi Nathan, Nick,
>
> (just picking some LLVM compiler people I know of... and trust)

Forget that part of the mail, written out-of-context when I was
running different
disassembly of GCC vs LLVM code. I figured it out and concluded that
the compilers
are fine and doing the right thing, it's a none-issue in that regard.

Yours,
Linus Walleij

