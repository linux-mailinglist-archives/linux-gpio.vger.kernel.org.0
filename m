Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18FC88E5B8
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 09:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730615AbfHOHqe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 03:46:34 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36306 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730509AbfHOHqe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 03:46:34 -0400
Received: by mail-lf1-f67.google.com with SMTP id j17so1085557lfp.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KvqA7IsnNASc7CJ4IW1giEyezsBAXupdGLtj7uVYzjo=;
        b=sVDXhXrw4Mg8Lz4WDAzFmuZ45tFznhV2dEah0EpU/mgvuFCNNZJ8gF3oAGHnwiC/KH
         XQyopiul1TP//82B6W+1RH4gU7cIYK9c2/2GBjbSCIwLi9c0pcyeQgSYfNVBn8siH7V3
         Z/iO5QKNgpMNJ//tZjmDHSpJ8IfF3daj+YkyW33pi8vBomTucb0aS0vkbqHqeaRPkpMD
         oODl52VETergHl5tqgx/qNYXfDntP+fOrksSkNhFreNxhgYSdpzQDLenR4hTUUTlIBvG
         aOKQurFvaPhT5g4ttSxG8sPcu9UG92/qMss9ZZVGDHDH+NvLylYJvdQi9FAfPHKzSLo5
         O2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KvqA7IsnNASc7CJ4IW1giEyezsBAXupdGLtj7uVYzjo=;
        b=KVqG/oYnh2hq+HVTwc5L1CVHjryBlxEYk30h52B92MGKgs0OyL3efglT8e60pA8Y/6
         j14NxC1wn+oXffsqSSjmbvIWgTFZgooUZ6UzxlLdyw7l+rGWNzzEWyp/A89wSknIQjZY
         zjBFFJYyvJkV+KbNZ/o2uVFBoLhq9fAN6wyE1iuIrI/A5ZliIVR+9FSPx6EFiqzImHtp
         idhmviJTwBTQA0Gs8ejT8TYaxu47g5yoWIGv5SRkOqxcvgtrwcC4ORulxs8nFTP5ga+a
         eZJsGdk8Ea3OhgBndZrzRuezovREvard77d8ioTuQVLKLb1w7DDjV2v3uAWSxW3s2jQC
         cS0g==
X-Gm-Message-State: APjAAAUcbnvEqu/SUQvNvfdngCWrVQCyoWlIfOL3l6PjckzOZoA/qAx8
        nfrdn+KmKTom1Q+ICasvIbZIHy3Vg82UNUSmsibjmA==
X-Google-Smtp-Source: APXvYqzkhC2NmCMDusfDasVwyN9Dfskh9WToFmpwdWNabOnvXr7WeusCj090idUG5TCvhv0VfZX4fsMlPOQ6am60p6Q=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1546229lfq.152.1565855192086;
 Thu, 15 Aug 2019 00:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190809082947.30590-1-lokeshvutla@ti.com> <20190809082947.30590-2-lokeshvutla@ti.com>
In-Reply-To: <20190809082947.30590-2-lokeshvutla@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 09:46:20 +0200
Message-ID: <CACRpkdYwOaiNyZ-hhXF2Ly4-tZ67o2u+ouRmsjoXiRbY=+YXoA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: gpio: davinci: Add new compatible for
 J721E SoCs
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Keerthy <j-keerthy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 9, 2019 at 10:30 AM Lokesh Vutla <lokeshvutla@ti.com> wrote:

> J721e SoCs have same gpio IP as K2G davinci gpio. Add a new compatible to
> handle J721E SoCs.
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Patch applied with Keerthy's review tag.

Yours,
Linus Walleij
