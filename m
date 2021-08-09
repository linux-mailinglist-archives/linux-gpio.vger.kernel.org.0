Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2713E5024
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 01:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236267AbhHIXwQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 19:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhHIXwP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 19:52:15 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B87C0613D3;
        Mon,  9 Aug 2021 16:51:54 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id r16-20020a0568304190b02904f26cead745so19620062otu.10;
        Mon, 09 Aug 2021 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0jrXqRkBtRZ83gnhxO+y+mF9sRlQocdZjgs7h9Xq6OI=;
        b=eaEDMNVV2qgRc7qo3x8sypZBfHnXs1CmJUVP115k1EL1u5UAt9iFZKx3NMe+Seggpw
         /mozlUix94Fy3RlO7pqu9BypBuKhzlRx712Xy+pMgxpzE1T8GOaMolTWKoSgUAjF1sAw
         BCHotheE+UiF/KHTaXlau4ZCneHE74zwyH4ACNT5SeU+hZOPM0kOrdJ/hNVp8src1XIo
         VD5KcnqFW0Hl+q5bFjoPnf/LivdbSI/fstVJqQO6hXUfxXy86GyGT8QaTmNztulp4Zdr
         lTaJvyCNTQ+PV0lE55kEJknn3uzIlh0S3+ezG+QwNMyQTMZXObqD3JaZSTfIn2ycT7m/
         JmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0jrXqRkBtRZ83gnhxO+y+mF9sRlQocdZjgs7h9Xq6OI=;
        b=jhc+gpnfZhzfhf/RiUAy+4lDgUbU7nQsTqLKnLM/ZY1QLGrzamO8kqOXxxm955rPdL
         uklwTuIflBXYH9YsqFK8DUu5a2Th39orBzGshru7vOdvif8+wm7vBjzeDMtjQHBrF5Zj
         s2W46ZiwWCsOfZhDwuGccWZSSoH2oRDoc2jprGNqr1wslr8xxJcgyhPcJSmWk8L23+Ez
         titPl48Q+SRHgI4fMhFWZ/vAOEzHvLF4kiLzVG8L1UNAWucbVo6E7Bn8Skk9VdU7HiQT
         bnPgNTyk7YXlVjS24FiSU2Ea6a4JjOLZlo77Uv3RTDv3Pe8iu6mg12P3gmSKCIDOnJoI
         Gy0A==
X-Gm-Message-State: AOAM530AVyzPCbJS1dVD4LY05lwjIUBKh8Lo8VA64l3URscTKwullQAl
        rTsYGlfkLd+QexfXMLal7egiIBSFUZ+zEviQK/k=
X-Google-Smtp-Source: ABdhPJwfAljIogBrZ82HBu3iCuZ6Da/zU+DgnEtHEwtQ0+Gwsd1/sRK9pPvUWdkN0i+42H/7seHYoBdOOoCkXqZk16U=
X-Received: by 2002:a9d:6003:: with SMTP id h3mr15893733otj.42.1628553113906;
 Mon, 09 Aug 2021 16:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210809121345.967597-1-chrisrblake93@gmail.com>
 <CAHp75VfQr6XKQ0UDQDq0pH7TK=_WUGBhRKcC_=-zzUGOwO8tWQ@mail.gmail.com>
 <CALpBJjpSJQquzaT14TkoEbTHrvtN8kiQWKLs3n0ZNiziB=iwCA@mail.gmail.com>
 <CAHp75Ve2i-5x-Xuoo3Z=JATFXqjV76aGyrnmEz+4d5qR7tLPJw@mail.gmail.com> <CALpBJjp7bRJF_ivPhxf=PKbZbB+1UZXOH=+soNLxoYxA_F4Sww@mail.gmail.com>
In-Reply-To: <CALpBJjp7bRJF_ivPhxf=PKbZbB+1UZXOH=+soNLxoYxA_F4Sww@mail.gmail.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Mon, 9 Aug 2021 18:51:43 -0500
Message-ID: <CALpBJjqyEZOtp-wLquCGQzrS4kcZ0h2AC6h2NBcx86zUsA65Fg@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: add meraki-mx100 platform driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

After some digging I understand why Andy requested the change he did,
so I will have a variant of it included in the V4 patch.

Regards,
Chris B
