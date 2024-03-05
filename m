Return-Path: <linux-gpio+bounces-4154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E609872A34
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 23:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A4ECB288DE
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 22:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2942338398;
	Tue,  5 Mar 2024 22:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S4oWTXX6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A921E4B7
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709677815; cv=none; b=VtZ/zO78tT0+4tcW/z5N9wa4EiyBIS0nLQyUtVNJr6kJDADpzMIp/4ejJ1WYqz9Ud5E38OQXS4Q7T53KBfi1csutnr5gZZ6unP6MbCeGlnoT0X7sbRSuHm6h7IxopSlnYGw3EvsmjFL+czrZ+ho2GCsRUqe1mgHAZ9G1c6t9vN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709677815; c=relaxed/simple;
	bh=M9jh5WEb5IW5tRz7dceyYVvVzGkNBzoZVU9ALfghlYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBwz1w/OZzFanWwFjJi69wGawty0qJMwCJDv8aoIB8YgiQs43vwh3h2c51chW7yfuTBl8CjTYOpEWb1YW9jTOL4CCUX3xudHpNchHdJ8ynxBhJfaIyZB+vcbbl0rQ5JruC7AAzG2gKaiVu3XU5vqvjH0FhJahryVcVDwYzrLwVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S4oWTXX6; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-608c40666e0so58681767b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 14:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709677813; x=1710282613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sstiXCgtxh1I1WdeLd29OT6yXthQI1YxVvocUUKixik=;
        b=S4oWTXX6LTGupEY05zss1sf0zwdg7w+oUhUDWkLk2U2M6BTxZmSvuDOoilCSxT5ZgJ
         2SU21eTLdCkMzsSJf9v3H6mywYdZ/7Iu1ZNzwwICkbGv17qNk5CY0kwcFd242xhMUoMv
         QUTlHGAdnocLy9RMnBiYnozUp/KA+CioIrCgUSR8DLc6SN5K5+GToTGhFgIU9T7vUljK
         pyDksT/ebEFpFJswtal9UFbQKK5uK5sktEUj/QTuNTku5Q7DBZx3skRrGnMcUW7qfG6r
         JJna/ICoJ9P67Xs8vSVAzkp5cIJ/Uxso9K1m1VE7n5Z123bv/IlHDAaI2gDGjd+Tf9lV
         +5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709677813; x=1710282613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sstiXCgtxh1I1WdeLd29OT6yXthQI1YxVvocUUKixik=;
        b=lP84sPY4Jz74Ogld4qosyrE7qJJPLOaw99AFPRzy4uFR2m08lJGD7cC82Z9bpYCeFW
         y85GIaP7xmF31syyHv4DRy5LgAjBT3eRiq21kIV+wVjNtmYBOpaG1iE5tEK+9t0h2o3W
         Imff/o1/+/GFRm3moRKbPVIJzsao5WSlrMaPCBARiBEECnTRKHb59EbMgMzGslJZs90S
         os//1ZxgTF0F3OxlEVq20ANCeDCRdntG9Gl/3MqjEBmAZHJBCwOXn9WmUYnqwLzDxGRT
         f3DW2sIZ396ejUhTmdVhX3Lc5FgyrGRmDhqBEKZGUjvc+Xfl9hijCcKLmuj/h3E5j3fl
         1+uA==
X-Gm-Message-State: AOJu0YwvinLA8DF3V+e1F8nlKdGzG3rQLq2rp45FTb0jJict8QIAIDvG
	Zj1lzewS6E9emIemENUY1tdon/Elp2kNA90HUd/PR93vNytGkE0KyRe9BbTbE2DrDfxjRelnIBD
	aIl3KQeIW+UM21G781sTb4HkUA9QcUoy7jvHmww0MaX5HqQTGe4M=
X-Google-Smtp-Source: AGHT+IFS0PD9/FUIwQ1baCjGkvctBDIFcmKONCKsI6xrDtthFJ7zqv3OPuHcb7o1XyrIBRTmFE7jCYgjzyUM4/XGYTI=
X-Received: by 2002:a25:1441:0:b0:dcd:3d0f:1ba2 with SMTP id
 62-20020a251441000000b00dcd3d0f1ba2mr9711276ybu.33.1709677813220; Tue, 05 Mar
 2024 14:30:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305143859.2449147-1-andre.przywara@arm.com>
In-Reply-To: <20240305143859.2449147-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Mar 2024 23:30:02 +0100
Message-ID: <CACRpkdYnFrB87T9Pq_kFDL_x399haA1n2hxPN0aSYO=KQSQQ6g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinmux: Suppress error message for -EPROBE_DEFER
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 3:39=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> EPROBE_DEFER error returns are not really critical, since they cancel
> the probe process, but the kernel will return later and retry.
> However, depending on the probe order, this might issue quite some
> verbatim and scary, though pointless messages:
>
> [    2.388731] 300b000.pinctrl: pin-224 (5000000.serial) status -517
> [    2.397321] 300b000.pinctrl: could not request pin 224 (PH0) from grou=
p PH0  on device 300b000.pinctrl
>
> Replace dev_err() with dev_err_probe(), which not only drops the
> priority of the message from error to debug, but also puts some text
> into debugfs' devices_deferred file, for later reference.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

That does cut a lot of noise.

Patch applied!

Yours,
Linus Walleij

