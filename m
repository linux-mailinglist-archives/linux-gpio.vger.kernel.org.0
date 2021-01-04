Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7290C2E97C8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbhADO4W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:56:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbhADO4V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:56:21 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5AEC061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:55:41 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id m12so64931439lfo.7
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GUTl3XYEPQNLqNITOLN3Dz7CfnmJFnkxpyLgfafi0Vg=;
        b=b097HQxmEu2vaEgM5lCSOZtRovx48qf732XtybaATR2L33DV6ZVW9ZQjzbEMP7OOMB
         0aLtZP2n3f29y8pU/wqV98P1PJhmliQQwGg1EpEpGl9SjigYtQVR7/bDrm3563toi/Im
         FA3RWbAmQ2g5InN47dV4rW8kdzIFZDZIofvE0+K/lsVUcbDBiBJ0vEXnk5+KQzobXC20
         R8j5QdC+xxRHPARPshsLEXXXPyAAWxiyUU/f5LzEA5dgne4k1771RsGMXkwqRZJl0LcQ
         8hpGpkJJiviJiHO8EIuVcAhu7ah8BHvC6QRAJcofmkbwZe7FovkgVwcvmT1+Ed4JB8KY
         rPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GUTl3XYEPQNLqNITOLN3Dz7CfnmJFnkxpyLgfafi0Vg=;
        b=SnYuzD0gvUfGen7VJKO+GCu8G9grFcG76kgsgCwGSgDCHphqSKp6QcHzJ2Q8P84fmp
         gADdlz8o33oi29bWbccR+fc6krD4MlWYEDeTkXJW7DK7oLf+8YvnxRznBeGs3xm/q0vA
         p78UjhVOCLqAJQL8PDc81G/47Cq3Zn4h2zZARE64dTqx/J9/Yrp6RNZREw5YRaOZTHes
         wkfqGJXHdmYyLuubAq5iz+tsXWoV2upp4M7/ngJ+Ci1hFH/m8g43vVUiUTEPIC+a+wsP
         UDGG5C09x2rxtDpWNqEYb+yd2KFtxee2zxQg1bj//FO9y7IiXmMePqwAp2rmBNr0q7SL
         50rg==
X-Gm-Message-State: AOAM533HqGYsaJQBQieGmJHWhcxMeusuFeq5B6zVGcpdDB7xIG+K8ZHi
        oztxj+SmE1HqiYsywxidyiJbVuJtDFCw2nzCDyGOuA==
X-Google-Smtp-Source: ABdhPJymHsYJdcAZKvO7bmnu0n4vNpuBqEjEguwLo09sKXdIJxMMqq/DaWfqPLZ7uicWS4GwTIQ0KnUgeBzevRcF0BI=
X-Received: by 2002:a19:6557:: with SMTP id c23mr29973497lfj.157.1609772139776;
 Mon, 04 Jan 2021 06:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp> <20201217144338.3129140-2-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20201217144338.3129140-2-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 15:55:28 +0100
Message-ID: <CACRpkdYc9Qay+hQqC+8AbaG5XuO+-gYbnPmRUcKu+WuMAu7R+Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: gpio: Add bindings for Toshiba
 Visconti GPIO Controller
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 17, 2020 at 6:45 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:

> Add bindings for the Toshiba Visconti GPIO Controller.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
