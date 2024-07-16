Return-Path: <linux-gpio+bounces-8220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B534C932848
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 16:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E71571C20CAD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AB019CD18;
	Tue, 16 Jul 2024 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlAW1NVT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4C19AA4D;
	Tue, 16 Jul 2024 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721139912; cv=none; b=rGprmmR0A68D8JR+e08VROm7wQ+VQzHXnBtmU88XqSnrDaJ3TdDB8xVnTx/kg2gle/sywB1BAVvNZTPmggemlPJeTlTXSE8GDqLALbW3dMRo+iCV5rL0v7zpN01docbqYnaHFOdebkrVlFl6HK/vUMsp3w2h7jEnCsxdrfGkvvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721139912; c=relaxed/simple;
	bh=bgdOOXW6HMKkMs1pz4zWIPaYex4ei6fPS0RqSXTZEpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGGlko3USCo6JyL7Z7f7p7PXdnos/s6/7PmQ74dnCBbhy/Gx0VEOoahMkeBycAWc4gHZ9fti6UiRa9T9VufyDHjt4WwBcgTvVw3+x1f6xTeWQJb6XFfN94NVK8pL40l8Q7jvoioh77wzhHOgYe9bPlR6CXFLqpenlQVVz/ChKzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlAW1NVT; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b05fab14eso53099807b3.2;
        Tue, 16 Jul 2024 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721139910; x=1721744710; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Io8ocOM3/SFjPGKaudMWtakUYl1fpZ5VprgU1fxT8Ro=;
        b=IlAW1NVT9FCOOFotISLl5p73XMbIuSsUuv3IlJZs05mku/tHAPWLQg0KiarZH5xyVK
         vXf8fSPb79VyY1LhWDRQ1fGoJYkGvbN7GdK/rKf51aRHRyHhmEq40KjaOOCgXQbLxJ3l
         De7aVurc8bPwsWdXEibq8jphJ4x+FPj2GEbbrPqmOla+L5A+nvhGA62Z0uPmVnQH0MbS
         abE1vsS98b1sSvajcavrSeahEp8deMAY9THjaJT//1lwkkPERMmBFSepiu67GJW5ujp/
         d/Nj6oP4ibRbhcPBQPmc8shUzvPvTZG6yhWyOAJj/nel7VCc/rFnNzmhgUeNrEXBJpR+
         9EiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721139910; x=1721744710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Io8ocOM3/SFjPGKaudMWtakUYl1fpZ5VprgU1fxT8Ro=;
        b=pmcv8pyP+VrG7qDUikg5TDH+A5fWWoLz9lFWw0sS2O5rbrRqGQ2CQR/LwminDuWB/I
         YHxg0ONiX2b7NcqKYo0oWvsr7HGSrK4v/rjsDCgT3QZClyi3pqL9qFRroXefflcLdOrl
         udZHXWQznn0EKiW4MHD5IfchClgWlkUxu+NSdNVMB5mmeJ908Or5k0Ks112uVFXxVQEJ
         B1q5gHCsYUJkXPp3lMFjJb4xbXGfOVz64c8mOM8heYtzWzAKBQjobBrS93KxgniuLrB6
         Sq3GZ6ZUq1ly/6AkBjj1lHWkgX+u+dzrcmOD2LdWvCVRu1QuWMjDH5TemslJZhsK977M
         oenA==
X-Forwarded-Encrypted: i=1; AJvYcCV/rrsk8DvmQDl99wNnaGbI15q8uUMDOX/Obb7c6ClBFU2K+AANDGgY2S6Zvfn7/ZB/yp7kIt97vD4zjfWiHfis2VE395LUiandV5M6p2pPT/UdQn8jnhsCYBSWWx8aDEGUVdwIWOaH6Q==
X-Gm-Message-State: AOJu0Yw411qI5I5bCA0UFcnb7haW9pvrIw6MkKlVkxVPy/iBRH5bRqmj
	b9+jyjqnsursufd/S7p3bSTDcy7SzW7gb89lttghSCPrX6sSf8yaIAYPHMSVJ5wBfVeoIMuxbJq
	t1tbwGM7kfg6wykgjKfkCR4UGxjA=
X-Google-Smtp-Source: AGHT+IG3Y418GEJOQa6ZtjMtK0nD0yDxVorgOSwIX1rqkQkDCzulW2MMqAdRjhVFhNSZf35ugKn5Papn4pfeHILmuF0=
X-Received: by 2002:a0d:da82:0:b0:62f:cb31:1be with SMTP id
 00721157ae682-66380f14787mr25593137b3.8.1721139910489; Tue, 16 Jul 2024
 07:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711193749.2397471-1-tmaimon77@gmail.com> <CAOiHx=kr=_-ra392XH-vR2fG-E5ZVXAutU9OP6xQRrzXSu9ZWg@mail.gmail.com>
In-Reply-To: <CAOiHx=kr=_-ra392XH-vR2fG-E5ZVXAutU9OP6xQRrzXSu9ZWg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 17:24:58 +0300
Message-ID: <CAP6Zq1jmhr4SHDG9+p=64T0AxgRTK7ufgDG7acrg=R5NnEp6JQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] pinctrl: npcm8xx: pin configuration changes
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: linus.walleij@linaro.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
	joel@jms.id.au, venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonas,

Thanks for your comment, will be addressed in next version.

Thanks,

Tomer

On Sat, 13 Jul 2024 at 15:35, Jonas Gorski <jonas.gorski@gmail.com> wrote:
>
> Hi,
>
> On Fri, 12 Jul 2024 at 02:48, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > This patch set addresses various pin configuration changes for the
> > Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,
> > remove unused pins, and improve overall pin management.
> >
> > Tomer Maimon (7):
> >   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
> >   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
> >   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
> >   pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
> >   pinctrl: nuvoton: npcm8xx: remove unused lpcclk pin, group, function
> >   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
> >   pinctrl: nuvoton: npcm8xx: modify pins flags
>
> You also need to update
> Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> for any changes that affect the device tree bindings (e.g.
> adding/removing functions/groups).
>
> Best Regards,
> Jonas

