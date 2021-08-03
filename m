Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D033DEA97
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 12:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235372AbhHCKN7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 06:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235349AbhHCKN4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 06:13:56 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85232C06179E;
        Tue,  3 Aug 2021 03:13:36 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id k24so3091470vsg.9;
        Tue, 03 Aug 2021 03:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JUIVZgPBYOYpuCEk1uAi8VzRGhVQKeMfw4ERDH3V0C0=;
        b=WAqlrFc7YoxRtZ2tJ+dLteZQQpk9TtrC7IYif8k/7+wY3T3iAFHMtqKtUj/3DfI0oG
         FSxIuD5QXbz1XDF42sy/tOR7zKUXFSJVlWGKEUJVQG0lUwJRIQsNbZVxTyjdX798+kSQ
         L555gTL117Zc+Gz5e79rwWWFBjnhjKp4+xFoGfPXJ8kficUq+cjI2jJXSm3Mq5ffyMXo
         6GrvKb4V0wlzCwHRjZiWdK4zFzzk3HgZ1vZfHFnn7+/j4RG8O8eqSCCX8SbJgm7VuxGO
         Go0hEUmQLVatmTnKK8F0eQxD9PJOIb5CImpOdYMGtYc2FdZvsPR6s+EjoQaZkY55Y81U
         xt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JUIVZgPBYOYpuCEk1uAi8VzRGhVQKeMfw4ERDH3V0C0=;
        b=fd7tCm6nsInQiJ39L5I11XmehT+MhHgINf2Ah9n5Udz10E3P76dl+uNd3gW8APB6n0
         ZY7prJahes5TcNfc2CtvB8OnQ/muXYSH7dvJhjvO5wvLfvbZuOdiXU8yCFoApl+5d9mW
         rUFczOq2WiMrJtHVok/QQV1tJXzoxA94dLBogrLk/Z3yORdSJFmfTclANI2VsW9AIx2F
         rU98JMV0fL+nfgibgHnjzYlskAw9Q7OJS0Ifdwnox1WKmPuoZ9TTUMGKTPu3OBkzyQow
         ekH6qajD48G8mtvANNg+7BlPKXqMsIcgroIEPho0Fj33WinxIJbdEOp36eB4gN6Bo4Y+
         S5Jw==
X-Gm-Message-State: AOAM531jfSv+rl4H7TJPSQzZF0MTqFZWIy09zIHKtlbdTxq09Pa/jpm+
        2lBT4qNxkKtPq4GkU8dKxMazJ/Wzfh5PtBELQ6k=
X-Google-Smtp-Source: ABdhPJzqyw93wm1d8X3oyH9dqTEIAPHfo1xN904AEQN8R0Fqdu8SCR+QTrGIz0LpUoLPCSlKiQ7ibC9mMf48faYVcTA=
X-Received: by 2002:a05:6102:3a5a:: with SMTP id c26mr13002221vsu.20.1627985615654;
 Tue, 03 Aug 2021 03:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <20210717045627.1739959-6-daniel@0x0f.com>
 <CACRpkdaEMeYieH=g+3jveWgPS_8CXSgC-iryzbsoZp7LLrkzKA@mail.gmail.com>
In-Reply-To: <CACRpkdaEMeYieH=g+3jveWgPS_8CXSgC-iryzbsoZp7LLrkzKA@mail.gmail.com>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Tue, 3 Aug 2021 12:13:24 +0200
Message-ID: <CABgxDo+BrfwahXW7eui1J5tLhQSx8=TB7o6TATLLS4G+HtxYXA@mail.gmail.com>
Subject: Re: [PATCH 05/10] ARM: dts: mstar: Set gpio compatible for ssd20xd
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Le ven. 30 juil. 2021 =C3=A0 12:11, Linus Walleij
<linus.walleij@linaro.org> a =C3=A9crit :
>
> On Sat, Jul 17, 2021 at 6:56 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> > Now there is gpio support for ssd20xd set the right compatible in the g=
pio node.
> >
> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Romain Perier <romain.perier@gmail.com>

Regards,
Romain
