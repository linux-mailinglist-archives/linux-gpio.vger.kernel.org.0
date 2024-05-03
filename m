Return-Path: <linux-gpio+bounces-6042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68578BA8E3
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 10:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 137E31C2222B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 08:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E90414BF85;
	Fri,  3 May 2024 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YwFsK3Os"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120813959C
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714725406; cv=none; b=XOVchRaVsKxc+TUuJTUM1dTBxGj1sEEBVokc4P7jJt4G0vAIP/p2BO8F8U9eiLuIsBpDCSXK4u5Eg7cOmkpWDm/Jhnqof2y0bMDpsket5It1QgkIMASdRYHC9d1Ts3N5g0YOBCMIKiuOw/4E0oaIBKE1iBw0NQbJ+TPxL6e0V9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714725406; c=relaxed/simple;
	bh=wRbtQpzidtZ6kk4EqzDd8mAoHGj4dWVE6VSRYNfcIS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCce35cUmq897XWuVI7pxmm8SLnb1mEipByVQ4XhuLoMypjxOgcvUPCjLRyFo44ihwOB8n0ogGuZ6fs1ZTsQcgTTV3VLbzZzMOwhdh7rudbgwOMtmojEYVpOVEpc8y95hPIRJubylPuQXNJBEcjx4KI7g4YK0OX5nzhmSaTjFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YwFsK3Os; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc71031680so8812998276.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2024 01:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725403; x=1715330203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRbtQpzidtZ6kk4EqzDd8mAoHGj4dWVE6VSRYNfcIS8=;
        b=YwFsK3OsyFJNiiRWD35T+XbEQsIRlZ2sWbDFr8feOOsRUWitqFIDCvrAaClR+pEoRX
         3k5pFP+9D8Kwi6vXVPTzU8wq76U7CTM4Dqi3zQ4QKUPcpRPCmWoIqcBDuveZx032c0kl
         k+5Gn/eAxGT0k9VHGL3VSx9J9u+a3H31f863oPFh/M2htRp5c4iIBaSomDe9O+VRILpu
         mYk8+qvK5UbQofeayrM4cV69zcYb3HhS9odpk6Zfg6CGfvuzLgu2be+LgEwkofjsVaBA
         vSualRZhWEK05BkjWqD7jUsguV4IvLDjhVh0ARdF5JFPmMrGGaMM2bKCTsscw/wo4HGp
         mMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725403; x=1715330203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRbtQpzidtZ6kk4EqzDd8mAoHGj4dWVE6VSRYNfcIS8=;
        b=APWAeXidw82L+vLPUjIffgPYPPgQ7GQrxOcwfeie1Xgkhc33ixLpbc1DbgxeZfHkvu
         R8u4fntg8+olq0SQrBxE9N8zisX2j6usvNpUjE2A//I7W4SyK5WSQeuhVD0Y3lwTcIq0
         20vxUXBrALNIZh22ryxVsMlkPTuyXJDz4cy5+O9opot3MYtUmALbkbHKiUwTUPJVqh1X
         udCM6oEEPdyqDKei/PCCl5hKlHF0uNTNEJaEU1SmXPYNGF4loxARl3JDNECqkO5s+MfJ
         lcRu1rSXeRXu1VmY9Vj2y2ookKepvlXy+ZThwx5i/It5C5cOY9AvDKbqNKAGVxSGkQ7Z
         W2NA==
X-Forwarded-Encrypted: i=1; AJvYcCUsgsuqsog7dRFTW4tDB9QVP7hDgchp65ETH027kULmkjJq+4o/TuWwuHirKgVXpJePsla37DfhP96Mwa7tTTkm3OxzJ8mNEyB6hA==
X-Gm-Message-State: AOJu0YyPMtNrmRntmLuLOYbQRP2xFAZzQkRy1KA7hcmhmS/w42GsMIDC
	Py5ZAqYizbX9Q2DCG/bS+WcqzidPV5JxTw79Jx9IcBVtjEaicYZM7R9O2K22Kvt7M+Vl3mwpvMx
	5q5JZgBRND2QB1hOQzxHcu+RbpA53+7s4qsdhxQ==
X-Google-Smtp-Source: AGHT+IGrx5xrV1BdUb4LcSt8Vhx2IgFFsnaDepsJtNrcYl/dh8fPYD2t0JfZINRBOkX6EZ7ged0A0nKmz0jq9uBixZo=
X-Received: by 2002:a05:6902:2085:b0:de5:9c4b:dd5c with SMTP id
 di5-20020a056902208500b00de59c4bdd5cmr2425440ybb.23.1714725403114; Fri, 03
 May 2024 01:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
In-Reply-To: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 10:36:32 +0200
Message-ID: <CACRpkdbaC9YR9f-q3fNjpH761VmLn2bhaaWpy-6Fhk3apOT8vg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: nuvoton: Fix sgpio irq handle error
To: Jim Liu <jim.t90615@gmail.com>
Cc: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, brgl@bgdev.pl, 
	dan.carpenter@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 9:05=E2=80=AFAM Jim Liu <jim.t90615@gmail.com> wrot=
e:

> The generic_handle_domain_irq() function calls irq_resolve_mapping()
> so calling irq_find_mapping() is duplicative and will lead to a stack
> trace and an RCU stall.
>
>
> Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

