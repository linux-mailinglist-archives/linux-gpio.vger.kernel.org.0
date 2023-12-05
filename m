Return-Path: <linux-gpio+bounces-1014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EDB8053BD
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 13:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D645281737
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 12:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE335A0F7;
	Tue,  5 Dec 2023 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byNskzpO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE9BA7
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 04:03:25 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-286ceba3f3eso1188864a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 04:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701777805; x=1702382605; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fJ/KuCXER2BI4o29cJJ2h2jbNdkt2RZ7GshNnYyfmjU=;
        b=byNskzpOiJd/BOIWjcSpNePPpib2Da0AXYtqHfU4kD59lvCfU5cIBSwQ7ge4OoeWzH
         K9ZDgZZfuMO6YMHxOa1mhhNvmU1UImYch21VWU15BNVvGvGSoy6JzF+2IwEsZ1r+oRR3
         /Q/ffOTt/sr0r1G4kcEXE3cGNeRDD7sHVZPyGnxq3kc7FbjzWCi9TKRzEFX17OuTF65Q
         S0wKibQKbxhuvTxdPLnnhZNhexaUjLsOXD3O8HqyK8zCNSaXAIm4prQrPsFcxDCPmXfr
         e1zfNsmcML6dimYD7+sH+vbYAXIQw3caNhuW60GYh7d6phQIQEeoasY5OvQ9jDvTFhsX
         n8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701777805; x=1702382605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJ/KuCXER2BI4o29cJJ2h2jbNdkt2RZ7GshNnYyfmjU=;
        b=Z9r0Gl4EPPRnEKWe9Q1bj86sty+MJn1TVWyEblv38QgZ1VeOYDcCGu3Fi4Ef4S0t42
         DgaVy4qZnG3jLtYMoIDQDN1kiGx/A4niSGSaechs/YR3traVsPpPPA8gayOT2Nz/qRBv
         MyZkfZGMqcTiRGfGV6vR6A5rmQeg9lhXGkrLS24Xh7bWLdWHrwcRODakD0ooyBZMuyh6
         8fqZd1r5v+P7RLrKZcnPUxsU/6zIv6x+79Xp+++lAexUwdvXQg7czdsRlsLxeZ43s+Cl
         wCSzW1xwYwV756yd7Bm7goPK8myL9Wlm7+u844LcJRurmI+yd1EPrmJoY/jiTTyrMafS
         gjSA==
X-Gm-Message-State: AOJu0YzbFbATbnOisrQLsCsgSkg9uBPuVlZoaBVIkOdi4tTh0j/vKB3p
	yt/jGhZuVoCXhV3Y0oLtBeXjfoW83rpBEexnYbeozXmTCQM=
X-Google-Smtp-Source: AGHT+IGZWIzkMXkp7ow+t/UYt9nfapaKdzYVDMO3XKOs4YYW+RkojCExsgNiWMHxKa4/f48w7PlFt3MGE7RsRC4y2ws=
X-Received: by 2002:a17:90b:90b:b0:286:a69a:f5ee with SMTP id
 bo11-20020a17090b090b00b00286a69af5eemr962096pjb.15.1701777804983; Tue, 05
 Dec 2023 04:03:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 5 Dec 2023 13:03:14 +0100
Message-ID: <CAKm-UmajXOivhNzy7hbL9-Afrk77uk=oSgCHQAL11jFOqE2FtA@mail.gmail.com>
Subject: [BUG]Xen : amd_gpio AMDI0030:00: failed to enable wake-up interrupt
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

 Coming here following discussion with QubesOS developers then xen-devel :

https://lists.xenproject.org/archives/html/xen-devel/2023-12/msg00327.html

 Trying to get Framework Laptop 13 AMD with xen,  the touchpad is not
working because (in reverse order) :

 no events received from evtest while device being detected
 i2c_hid_acpi i2c-FRMXXXXXXX: failed to reset device: -61
 amd_gpio AMDI0030:00: failed to enable wake-up interrupt

 Tested with xen 4.18.0 and kernel 6.6.4.
  We need to get the kernel to be more verbose about the issue to
understand what is happening.

 I understand that this GPIO is vendor specific
( https://lore.kernel.org/all/20221012221028.4817-1-mario.limonciello@amd.c=
om/T/
)

 Could you give us some direction at that point ?

Thanks,
S=C3=A9bastien

