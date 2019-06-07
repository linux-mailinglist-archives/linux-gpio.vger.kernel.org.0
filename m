Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB00398D9
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 00:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbfFGWg4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 18:36:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38307 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730056AbfFGWgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 18:36:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id o13so3046485lji.5
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l+khBBUKO+T+6jEQl6jfi10f9lijFzuP3gRY4E2wVHM=;
        b=AvjWrnMHNwzgXunPuuhGp1BzA/hhHPX5wMDEvokLp+7/tnogePsuerY59PSipnUHsA
         5ix3VSCMCQAiPpSPnahNx+f0CUMuml3C5wmFTtDhfE0cahBce/nO0504D3KASjiaUvwk
         pNB7COX8E8N9gfZPF7gXkgy5HbrBfLMt6lANA9MiDGT0Vb6CytYqyL2sKmVvM4NaFDQ2
         GqElsGwImBz/7MZjNz0xf0gjFV6wO/RrXZKsnksTj/+pUsYvm1FpUkqMXlbksFoE5mgH
         BsQlcb9HQRAdYY4aQiaHLzyFyiIP5ks0Gi650xCSnxOGbogyASxhDSPEPk1uTFHnnJDv
         g2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+khBBUKO+T+6jEQl6jfi10f9lijFzuP3gRY4E2wVHM=;
        b=JDkn5JEIX+vGtpiOAyeHpr7i5EsHWxmMDizC257PU78G3M8v87vlycsnVa8AFJQBmg
         APMndVlcvEjOO2UdPN30T4qtF6gl0cq7DFLVyyE1w6j/0E4MVTNVnU6Y4OX6Ic0jzULW
         dMC/auQonA76jPxZNGW4p8FV80irMOIu5acHyrBCJ291fzyRVNei3Ma6BUFvvsC+ag8P
         kQox/fb7vgC1UcSK2E8zj7q+31y0EBmuEBaTpnFxIe4nsukWc1SCgOJptT8NHtJOj/mm
         a2Qwy2R5kXPbuAwwESUJCDagwhlXiUAU9FwCZ4AGhZX5yXYAy/C5c5ZWD3F7ErZFwrtV
         3q0Q==
X-Gm-Message-State: APjAAAVMdSV+h55bQOiSwbkSMIu9usVlMQIpsdmYlEBMfYWpWGgjpIWF
        /sg5vktHOgFLr4d2AAzBSGuCYAw0ExxUTZl4tGet3w==
X-Google-Smtp-Source: APXvYqyBNawXjCYzHANN7vW1O9qXAC2FYF/LQpC3GE4QTC5eMwPWCe5HT2/ZqSKUoUxw2kv5mtc2gDbH6E86Q5fMtAo=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr29323284lji.94.1559947013914;
 Fri, 07 Jun 2019 15:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190605080259.2462-1-j-keerthy@ti.com> <20190605080259.2462-4-j-keerthy@ti.com>
In-Reply-To: <20190605080259.2462-4-j-keerthy@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:36:46 +0200
Message-ID: <CACRpkdbn6gyLeGA_QyNbvp7VFqJM3iKhCevx5zotsAVkL8SoZw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: Davinci: Add K3 dependencies
To:     Keerthy <j-keerthy@ti.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 5, 2019 at 10:02 AM Keerthy <j-keerthy@ti.com> wrote:

> Add K3 dependencies to enable the driver on K3 platforms.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied.

Yours,
Linus Walleij
