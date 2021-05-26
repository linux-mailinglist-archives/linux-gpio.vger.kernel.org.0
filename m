Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3258839170D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 14:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbhEZMIe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 08:08:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:38268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232027AbhEZMId (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 08:08:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78161613B0
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622030822;
        bh=KlIxLle8WdAZAgXdP1Ol5GjT1Q8sWCSEb3VQF4bNU4A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oXeKCUWCv4iwFeDYLweuPLoAPX9KW8tWEPjyxO1Syoz23cU33fri4biTohDl1sfm7
         pNW3tle8FVJtk7UNYxKR4pxQYW1Iy8qgJcfcFyL6HPHjfJsr4Lx0zZOdVW5yezmPxq
         Z6U9tVGMrYbDBv9oIa39Wd8YMVwMGLVDguPq8WqOX9sjCS6/LrxSXHEL3UGDZD6JVb
         HQj8GHRu4g+3qpcUC5pmihT0lR5he2SMFkq9d9WuUAMD2VM8+V+MUmNrhWYDk/CGsu
         jKNTy1nLPmBDB3194cHMv6KYzhSU4l4v6QH7/N4N/wMH/XusjZGnM3Cqw6nigq50Z1
         ei7AF1JHlwLow==
Received: by mail-ed1-f49.google.com with SMTP id b17so1196344ede.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 05:07:02 -0700 (PDT)
X-Gm-Message-State: AOAM5300smL1iLSnbQgIlupQL7A2M95hewOD8aRnFKFOyj7ttSjkoihu
        g4NoF/v238KFZJrdDJdtu3jikzVM3yKveUxiQh4=
X-Google-Smtp-Source: ABdhPJw6WmRP3uG+6K6aIXOechIojz0Bu0waHH3CiU7XaqEJDEnogvvQyzgF39cp7AxsdszwfoEekSwnALxXdTdpEgM=
X-Received: by 2002:a05:6402:2714:: with SMTP id y20mr36800925edd.348.1622030821071;
 Wed, 26 May 2021 05:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210525054149.1792-1-kunyang_fan@asus.com> <20210525054149.1792-2-kunyang_fan@asus.com>
 <CAHp75VfHEv9xOZT6BKUcjwL2RcoDyv+ZknvvLqU1exZJW=uNRQ@mail.gmail.com>
In-Reply-To: <CAHp75VfHEv9xOZT6BKUcjwL2RcoDyv+ZknvvLqU1exZJW=uNRQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 26 May 2021 08:06:46 -0400
X-Gmail-Original-Message-ID: <CAJKOXPcr7vVQ37dho67_3JoTEG1fm-8BEwGXaE5Xg6ZHT9HJcg@mail.gmail.com>
Message-ID: <CAJKOXPcr7vVQ37dho67_3JoTEG1fm-8BEwGXaE5Xg6ZHT9HJcg@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpio: add driver for AAEON devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     aaeon.asus@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        Kunyang_Fan <kunyang_fan@asus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 25 May 2021 at 04:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Tue, May 25, 2021 at 8:42 AM <aaeon.asus@gmail.com> wrote:
> >
> > From: Kunyang_Fan <kunyang_fan@asus.com>
> >
> > This patch add support for the GPIO pins whose control are
> > transported to BIOS through ASUS WMI interface.
> >
> > Signed-off-by: Kunyang_Fan <kunyang_fan@asus.com>
>
> Missed SoB of the submitter. Dunno if it's a critical issue.

Yes, it is. Every person touching patch, which includes sender, must
SoB it. This applies also to other patches in the series.

Best regards,
Krzysztof
