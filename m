Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716A4216D1C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 14:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgGGMsV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 08:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbgGGMsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 08:48:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24839C08C5E1
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 05:48:21 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e8so15454024ljb.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gwFkr9PneqZ4BhGceqJcWLMBZ8ayMTmUffDRY3KogpM=;
        b=C8GJ0AEZDliCyMztSZ1Ndjq2eS0XawACLjHxvQBVSC41f1JQyvBNO0ltCwFvJ+V3Wp
         FuocpbPZlCwKmG9B0Znl774ZjJ61Hdrthc/ejy+RptFvHBL39dz0DnJyE64ihYHgm1ib
         TiabjcFpoEc8J08Rk8lLIbNiPp74m4juJnhe7M2q+WvfkKJ7TAaGI2tPqMg6JhvX6kxk
         1m6LRktdHE2kCLlVyuIeUdKDj6ThiAmxEyLUB9uzWDwB3CqACC33zI3jM5PJfTp4Upxe
         HgTmMk9Q9BOFOY62P6KR2fJV/CJVSakQ2J2x5L5OB4lsIXDCJPAAR1TgixQgdDONKE8S
         aQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gwFkr9PneqZ4BhGceqJcWLMBZ8ayMTmUffDRY3KogpM=;
        b=oPHlRqkRF1wnYw2WQ7tp16imx4f1vzpPX4LYL5ieG6GPZ0i7Au9pX9idREofKaVXol
         lq+ePQ/nev2fNaa3EOdNL12x8TrMjsPxr4LQ7BM1zveTTOy3xH5rgaSXGvxmZTQFu1S6
         eHWWzvNwQ4eZFb2xjVA+76X8DWpCNBQfF1yrkh8S3EngOPDJFRxiLdQdGPhVxARveq5R
         g3+7adkbWVRKRlVzJNDg9oXkJ1pRiEUd6c0R6kvUgnW4jKq8lTMj4LMFMS6HQ1cGmAMs
         GYrMnOe8sZwmHMoEmLItWPQmQiMjrRVlRdnLGydTqnUUfzo2F71EjSLVMUWaC0CFZuJW
         GFZA==
X-Gm-Message-State: AOAM531Bv/ASKD9R5COhs1ib9wlF8E9k7Eurdm0+DpFWrl0+PKMy1+tF
        c6l3+h+TXnng/3KUmftapB1tBwONeSxwBBdUaUeFTw==
X-Google-Smtp-Source: ABdhPJw9YFOFLjB0RSApXXWHfC49AyKtASlEPy7NeIw7/vvd9BnOj3rZCXjqZMc1E4Q/oQmgHVx15nwCJxmyXW+poWg=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr31300548ljj.293.1594126099519;
 Tue, 07 Jul 2020 05:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
In-Reply-To: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:48:08 +0200
Message-ID: <CACRpkdangAYj6_M7=P5yVncATozZUtb=Fo3zNKYCa9FwHLFfxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Qualcomm MSM8226 TLMM binding and driver
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 27, 2020 at 9:34 PM Bartosz Dudziak
<bartosz.dudziak@snejp.pl> wrote:

> Binding and driver for the Qualcomm MSM8226 TLMM pinctrl block

This looks good to me, but I'm waiting for Bjorn to review it before applying.

Yours,
Linus Walleij
