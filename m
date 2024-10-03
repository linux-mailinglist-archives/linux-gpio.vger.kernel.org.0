Return-Path: <linux-gpio+bounces-10762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088BE98E833
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 03:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC79E2876E3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 01:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DAF1401B;
	Thu,  3 Oct 2024 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrzhmPwf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE4338C;
	Thu,  3 Oct 2024 01:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727920352; cv=none; b=t2xnxU/HCMd2r/BLCnL6H4tnFVSbx59HYoR5TMhIIzNy6FCQ/lVIpgYmAXSA9DTWZlngqS8LDOY+a0xtWbK3LFgyAXNFfk2q+qwTYrC1ftQeedExOg6z+UDE9Vyq07uVnm4iZih8KiDFnWx4S7QGXfKzs5WOK2otnHM1IJyTiS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727920352; c=relaxed/simple;
	bh=I44gGwY9THLfmM2OoQ16ffwqLkaVkytRmo2+krRsG18=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=F6Kpur2imT+ryfMH9kSNvW31lFG2zVZT5Cw+HQGBsgh5JIFAhwwGgBdGeHgkLqtTJ6s/8IIOr4EnV5TTWco+/bJp6pdN9mSNfFSeViW0dErFXGuz3ktFMgu3hQGklQDB9yQWEoxysCD+wUF+ZqCIsI2v6PDRO6GiQxlALd+gJcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrzhmPwf; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5c895d975e5so32910a12.2;
        Wed, 02 Oct 2024 18:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727920349; x=1728525149; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I/rWvsZuJEnymhTDM7Pm8jF+pqqOZ7ND8pv7IT2OCMQ=;
        b=UrzhmPwfjbTMd0TfpjiJwb/6AoOX/8jP86fyE+8GqL6zomSCtMxCiqULf5wKGJxKas
         XBTyAKbjnvKQGHHx/ND0p6qINLELvghGi1aeQsx6udg3Fpm7vRYPH4GN/xhUMAzvt76s
         HIbJP5s4ODX8ltxiTmQl5/Owc/XMSy+0S3f5Mhtf2WUkWUt6WcySbC+2hi9eTVjxoduP
         RB65Jcxit6vDcAmFyhbIqczJr5V1nvkBvbd65VQMlLFhj/2MeS9x4e4l93FQ2lSqRBMk
         YnvHXLrhAkeGPcwBJRl4dIZSWSfyfNtDrrLVGQHy2DS0zliS4kGOTdgUwbbXkP7lcW8B
         S4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727920349; x=1728525149;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/rWvsZuJEnymhTDM7Pm8jF+pqqOZ7ND8pv7IT2OCMQ=;
        b=BQ4c9ZZrgGuc7w8LTi8zIKYpUtg/k2Wvz1/4ulg1/oQEKUbai5JyDTo4ZUH1TopG0D
         R4LqaTx9CwmKJc73oe84dLcMj//znzc/61hMV40s+H29oz63rNIwqWUboBYOExoRdGvj
         lzuz4Ig7UE+hFeldx0D3L/cCHExjhADLi/aSf0s1n9JUuLFobW+GOvZoHoBMdIBSaqlQ
         tFh2wX3BcPLdswDxeWZ3cSRSedQWvhW682Ukjy4deQf8z8MDuoWtsXDU+HxWRsGPNEQ0
         HvDZc/FOA3wDv5rpc4sRS0JiuPFib23YcLwDsADJcfKLWOgVBAUHZZEWfMdnaU+/5r+V
         KjBg==
X-Forwarded-Encrypted: i=1; AJvYcCVLvBbt/imqugsfFNXrZo7yCpOmq5g1CF2+mdBL3NQ8YSN+sznbTSJ3H7kZRXFNeLj6/D3v3YrT/L/PenE/@vger.kernel.org, AJvYcCVfdv8JM1+VBdp8tfUFxc4RepCzbBcghwa0LWc6jjcJq9S5Ekq5s47n70Il6i+d0dFnPbWV5ZWUc8hs@vger.kernel.org
X-Gm-Message-State: AOJu0YxTmYpQt2bLJLWQcbpynfDsZmOd5YLKSOabsXJ6qsoFoo+FnxJU
	xbfmTYU5RgtQZ/8Xz+vh+8iNgzV7MdO9UPQdJoMvlj3tfFnXM29KNa6doDfM6DGUzp0W9+F70V6
	2qa51hPxzbZf2+lBaUo0ZIu+Ck58=
X-Google-Smtp-Source: AGHT+IHjSofrdU7L5Fw9Rh13LE6vSGJ31h7JyZrmS4tF2mTuJtqY3WvYbVHQ5oopKpupwP3CLt8ritTnQkMoNXATgdo=
X-Received: by 2002:a05:6402:40cf:b0:5c3:c42e:d60e with SMTP id
 4fb4d7f45d1cf-5c8b1715fd1mr1743631a12.0.1727920348583; Wed, 02 Oct 2024
 18:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: xi xi <clf700383@gmail.com>
Date: Thu, 3 Oct 2024 09:52:16 +0800
Message-ID: <CADPKJ-5EXJnihARj49cr36Q16ApU_qQeEA0eS=kx21s1oAR=wQ@mail.gmail.com>
Subject: [PATCH] pinctrl: fix Null pointer dereference
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From b673ea2897c5efc60b4ad8f9b4a4327ddce0737e Mon Sep 17 00:00:00 2001
From: clingfei <clf700383@gmail.com>
Date: Wed, 2 Oct 2024 23:33:47 +0800
Subject: [PATCH] pinctrl: fix Null pointer dereference

pinmux_generic_get_function may returns NULL, and its retval is
dereferenced without check, which will cause a null pointer dereference.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 1bb78b212fd5..9331f4462480 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -798,6 +798,8 @@ static int th1520_pinmux_set_mux(struct
pinctrl_dev *pctldev,
    struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
    const struct function_desc *func =
pinmux_generic_get_function(pctldev, fsel);

+   if (!func)
+       return -EINVAL;
    return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
                 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
                 (uintptr_t)func->data);
--
2.34.1

