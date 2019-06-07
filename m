Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCF5398D7
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 00:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbfFGWgZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 18:36:25 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34824 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbfFGWgZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 18:36:25 -0400
Received: by mail-lj1-f193.google.com with SMTP id h11so3066263ljb.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vgBCp4ESqu/SkK4WjZN/J9BX9JZ55PQyf6iWcQn1pSk=;
        b=GS9SPtDECv/U0yV2YQbOLqw+5LBwG6yGmq3y+24ZDxq1wYtCWbp6684rpb1naONMmZ
         H9Bme1mZGkHanhmEaavYoAodEAPDLAnvUYMB5nInTAqA5E/2gDq3mA2k74+HR9wcX30i
         6wfA6NiuKxVyjmKm2ZWmIzwgna/YJnHd//h99lqBWIBuAt+FD3ZkiKB/tC00uLBSXx7z
         XRVvgFqXW4RTAHMogLX8jJM2+cgfIVy8aGmj2tVQuI8FFNx4Ic1Ip2McUg0Ehv8oo/x8
         La7tM2qf2pNahrmrJ8sz8SNCNwVOJZwbAoR6bjHucQnPWDpaOX1PnsOXGFGDcwLn3gpX
         3gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vgBCp4ESqu/SkK4WjZN/J9BX9JZ55PQyf6iWcQn1pSk=;
        b=Pg/T7anGbii5BAU7Nf9BSyZqSrikWUoB8Nc88xbjIWB5GUFAVw3SUkQ9mJFhh1IcrV
         FbjEJxcC7Eq0/gCevBbVPz73V91eu64N8jV7croK6mx47q9FkNsVBbip3XOpaY/osxU6
         G4bYAXoaPN+7Na6WVDzUYp6ISHIFcSnxf+JNghqCf0lXOrg/v+z8jhHBd5RNJK2DyJyj
         nxNaAarxcQV43CH7xf/yISRoUvykayOj5bXBtHby+OqlA2tEXtjOKiKqlvq0qUHhbzYz
         3ErXal5VpJ3YP/sIOhDkIThmjyeosBgSfQeljuY6FQDazatU7VQdKEvhEO+JXHtICrBl
         h7xw==
X-Gm-Message-State: APjAAAUdoYoFuZmVQiRH5bfGVWU0Frl3epK2+jQIZxtOysZqgpPUfMTh
        zFHYF9pkb3w0Y3kB5DuVfArfldDFYVL+C7dZepbZwQ==
X-Google-Smtp-Source: APXvYqxgE0ibblyo7qO/QgVZ5DieoVrgk3BnSd4jKinDWpu5Epy+KJ3s0E61Ts+2sw5YmkRrl6ga0cYi6auCd3LdIeM=
X-Received: by 2002:a2e:5dc4:: with SMTP id v65mr20396375lje.138.1559946983640;
 Fri, 07 Jun 2019 15:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190605080259.2462-1-j-keerthy@ti.com> <20190605080259.2462-3-j-keerthy@ti.com>
In-Reply-To: <20190605080259.2462-3-j-keerthy@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:36:16 +0200
Message-ID: <CACRpkdbo3ceokuyE5UKiH3qH2JCeu7yNAVGa1ZH=sZ5T32BHUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Add new compatible for K3 AM654 SoCs
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

> Add new compatible for K3 AM654 SoCs.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied.

Yours,
Linus Walleij
