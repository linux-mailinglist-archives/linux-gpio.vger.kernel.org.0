Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75ABC79FEAC
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 10:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236426AbjINIoH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Sep 2023 04:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236398AbjINIoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2023 04:44:04 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B781FCC
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2023 01:44:00 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d818d65f23cso464906276.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2023 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694681039; x=1695285839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyRbwpOpfrs+RuO3IQbIOlbvQDpCbgtuM9CKt0JcRkU=;
        b=V479/7QyHgvO9B05FFxXv1Qrpo+umgEAVbKa5QXzsaJQpE8NN7TmaYvKWssYjJuloA
         1yQjM6vfuh6DTgMKXw84fY+vnQUdV+6DVX2ZYjajvPpYuk2Z2r515/X4h3qzNHermkak
         f6/21a4n+oU1jVsy3p4kdtClmtdPdK5Bp9naDQHSVT5MGNsAyAQCJ3vspNNYssM1njw9
         c8jNrfeM5MwC7IHoCLAy1TLxKJUO6uZgJhY3pds0FVVOwIeR4tWgYuRWtPLjEs3LpnCW
         ABNUISobpOhQs5vECgfZ2vIZBsooVQqN6VBVqVqyYH9Isllnsp8oryZbN5rmOm1EK2Nw
         cXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694681039; x=1695285839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyRbwpOpfrs+RuO3IQbIOlbvQDpCbgtuM9CKt0JcRkU=;
        b=EspLZ0ifLCYIBYcnDF9OJvkWBly2g5kuBZ678s+vNn3eZTIpQxe3BM2nE1+Da0/2Ed
         KkKUF2J/SnDwF32//bA+rvSzcgYRQfasvebaBIdfu2//ri9ii7/OQz6bPCq0Qh7ChoTZ
         iy0mHEVRjr1e01KatbRpgx5ZyVVrVq85StFzTGr+3Gtbmwn1OsdyAze2DzJncvafOVZV
         LquCjIEcTEJJyTqFCnOa2Sh6G/CGzjtjyvoyuN8bwMkV5QowaWH+GQPIhEJj700yd0ay
         OlLyfiFtz9XZdp70iHp+CAQWgaS/Jkv937JUTEyOPTSen0ixRi3UqzPC7hlcJilVIhKk
         hIdA==
X-Gm-Message-State: AOJu0Yyhs7CBlvV0D+YUM8BDnB01XweCL2vqas+N2MZ4WNWyg/k5VvnF
        2PgzkTQMnh5ALoQIjX25IJF9wWdnzuEYhA24zkDEOQ==
X-Google-Smtp-Source: AGHT+IHNsbytI0Dr2hoERfT8MqScDXywJXb+TtAKRnD8EbiehyDqHD7t7j5azaOOoe/2EMhhy+8J4pR0F1GQpYY4cc4=
X-Received: by 2002:a25:6806:0:b0:d81:61c8:aef5 with SMTP id
 d6-20020a256806000000b00d8161c8aef5mr3478844ybc.40.1694681039250; Thu, 14 Sep
 2023 01:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com> <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
 <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com> <811225f8-c505-7344-ac18-882472ee0348@redhat.com>
 <d232c11d-901f-4ebc-b408-bed042ed8da9@amd.com> <6734c409-89f1-89a1-3096-4054be29faf1@redhat.com>
 <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com> <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
 <4246946d-40e3-7df7-3fc4-9aa10e1dee10@redhat.com> <b9f879d5-55b8-401d-b154-8066cb66d20f@amd.com>
 <0522393f-9f0c-4c59-b961-9b8d865a645d@amd.com>
In-Reply-To: <0522393f-9f0c-4c59-b961-9b8d865a645d@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Sep 2023 10:43:48 +0200
Message-ID: <CACRpkdamAs=c6YBW2jgQ48kUPHqUGT=b89NSXYYttf0RbnpctQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, regressions@lists.linux.dev,
        Shyam-sundar.S-k@amd.com, Basavaraj.Natikar@amd.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        lucapgl2001@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 13, 2023 at 11:21=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> 2. In better news updating the BIOS fixed the issue in both Linux and
> Windows, no kernel patches needed.
>
> So no further work will be done on this series.

Is it easy for users to update BIOS? I.e. does
fwupdmgr update work?

Or does it require flashing special USB drives with FAT filesystems...?

Because I'm not sure all users will do that. Or even be aware that
they should. In that case detecting the situation and emitting
a dev_err() telling the user to update their BIOS would be
desirable I think?

Yours,
Linus Walleij
