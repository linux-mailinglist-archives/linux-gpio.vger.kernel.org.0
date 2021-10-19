Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFF2433BA3
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 18:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhJSQHZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 12:07:25 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:41558 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhJSQHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 12:07:24 -0400
Received: by mail-ua1-f54.google.com with SMTP id r17so862992uaf.8;
        Tue, 19 Oct 2021 09:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=JSqdpuJkG+vwp/l70H/GBgr1lad2q8Jo4l8xHV6I+S0=;
        b=ZEgzzZwGIT4gWVYTrznjCmUX9JHMMkCPnV3kgV8fj0FyeClV6YTOHafVipvx8sRT9e
         Z0wkqIgQt6cIqT2S3PsXLX3tLWt5Ll1fVergU+xIlEBJ4GgtR2mN0hKT1TY8YOxpkQAK
         KBJffNtX5oiomBnxaQ5KJzDtsOzpKJrxF8JqTo6Rw1s1Sr/miChZnno13S4BuNiypAOq
         FJWMxwCJ0aOqXzzSGEIuTeehIrXZRXqsbBdlmeWMPM89msUFe8DZChDvVSQlfNfm/KS1
         fafA/JgO9rql+ByzQOfAOc7YCv04GF2q83cNc9zjWDoZTl6gM2Ie821TbOM9lxCn45fJ
         Eutw==
X-Gm-Message-State: AOAM532eoh0S16uqo64wiYIuNwF8qBr9BI7/Oy5HHbSNa/dV66GFAvgS
        gvohrhzYDwz1c5Q9G2/ROeQHBnX/NsBwkQ==
X-Google-Smtp-Source: ABdhPJxnBhJ3OxOEBJnBC/OpZXHOg74cYoRHM81BIa/Pc7pPJ3fw/tSlVL15X9loVmUU2b5XPfugpg==
X-Received: by 2002:a67:c808:: with SMTP id u8mr35519244vsk.36.1634659511135;
        Tue, 19 Oct 2021 09:05:11 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id k185sm10669009vsc.21.2021.10.19.09.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:05:10 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id q13so923030uaq.2;
        Tue, 19 Oct 2021 09:05:10 -0700 (PDT)
X-Received: by 2002:a67:2447:: with SMTP id k68mr37808520vsk.38.1634659510340;
 Tue, 19 Oct 2021 09:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634630485.git.mchehab+huawei@kernel.org> <aedef820f4dc9af5d3a3fcce2ad733d75e1ad4f0.1634630486.git.mchehab+huawei@kernel.org>
In-Reply-To: <aedef820f4dc9af5d3a3fcce2ad733d75e1ad4f0.1634630486.git.mchehab+huawei@kernel.org>
Reply-To: wens@csie.org
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Wed, 20 Oct 2021 00:04:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DGqnivxy7FH1ZiJ4vUTrVGDg10odOYG4-ogeY3RnfuA@mail.gmail.com>
Message-ID: <CAGb2v66DGqnivxy7FH1ZiJ4vUTrVGDg10odOYG4-ogeY3RnfuA@mail.gmail.com>
Subject: Re: [PATCH v3 20/23] dt-bindings: mfd: update x-powers,axp152.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 4:04 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset f38d3e404326 ("dt-bindings: mfd: Convert X-Powers AXP binding to a schema")
> renamed: Documentation/devicetree/bindings/mfd/axp20x.txt
> to: Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: f38d3e404326 ("dt-bindings: mfd: Convert X-Powers AXP binding to a schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
