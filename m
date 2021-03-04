Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF6C32CE3D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbhCDIQ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236376AbhCDIQU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:16:20 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D01CC061574
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 00:15:40 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id m11so31360817lji.10
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 00:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SJyZlyEHfVnR3j+KQtSDL4OnWvfrZW9Sy7fZt9eeLfo=;
        b=P8t+fHloRwyoIkI05NgYKdBCj+KdvhlHCPckJ8tCWVkZH2q2Hn4sfLlHhYgp7BnoeE
         eoFoUC6WWaVF5Uhle/DtZrldalw0YHLZbr/dsqY9ONnVILQTRJhIm7kJKQNxnLf7awcZ
         VmQRCa+UGKBxD81acuKo6BhSTroMA/vwyMVeDrOZm8bTjoUunxISbeT/rWjXcxl1drK2
         UFv1w96BtYmz4K3KbfXWmO4lsABr2MErnhBVS7tCE4kXU6S3iFWNjTi241Cs32nzI0+6
         9hnbpVuKoLqpwrZKCtQOzcXiifofVpgaQtcqR6RTfqCrMfSb/Mp/d0wX9ctq42TZXGK2
         qPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SJyZlyEHfVnR3j+KQtSDL4OnWvfrZW9Sy7fZt9eeLfo=;
        b=WGZGXLJgJqvtxNNOQbVrUcu4gx4DoF8r6fS0u1PqC6B1D2Rfbaq5S460LT79M8XoLv
         o/pkWgh/xlMLqUarCA9ctLuqKwkv/TGPLOzXrjEYvYM+obAsfILdZi/HDIUMECaMAxkC
         h4PFFcY7p14BObLBUuMeltdbg2RvfSvWaKW7ksfBAQSxE12MSQtmOpEEHXb2SybNqi2q
         PnUmA/D0Flg5Sk6BlXXi8j9jhmb83wva2MqzpjnBbLL1eM7S2iuoqcmojNQUyr56oIC9
         r7Eq6nvzEvMrhykpHu03MfMocK0veTy9cosO6QTJckEOTbHKPAfSjR6qS2wVo2ODW21b
         ezug==
X-Gm-Message-State: AOAM5331HehOPEEQG57tHsZcsRPAgqmn4WTBt8AKrKwvx1U256qXNIMg
        lSH/t0rGVnx+jza34BCQebG/u3QwWn6Y9bOUtYxFIg==
X-Google-Smtp-Source: ABdhPJytRMXDzPZQu9LPmyCokZi4HFF5dQrsReDzAH3IBF+V58SrZ/BITOlZXALmZp0DjFGB3W+fMGqSsDPtpdNrgfY=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr1678123ljg.326.1614845738903;
 Thu, 04 Mar 2021 00:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:15:28 +0100
Message-ID: <CACRpkdbG7LJ9jwdsdAxTad8LSKH_9BqcL0N+DMhg6Sxp6Mr=uQ@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: gpio: consumer: Mark another line of
 code as such
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 3, 2021 at 9:35 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Make it so that this #include line is rendered in monospace, like other
> code blocks.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
