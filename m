Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9223849030F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jan 2022 08:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237633AbiAQHpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jan 2022 02:45:38 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58170
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237634AbiAQHpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Jan 2022 02:45:38 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2A08D402A5
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642405537;
        bh=BnlFRfnEyWAxe1fw6gmGyUXzbXb/Exxy2EiruYyTAbQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=StB5wBV1XLTBI84hCIoZtLuROo0ozvFtdtwF3vN4ht4NUjcz3nnjfl9k15XGhYHCq
         lNhO7y40gxfI41FrSGRqeVyXaHwIIVkgJWuQYqdQR0jJbMOEypykpJOhyUeN9YBjBB
         pJ5CaoOplMEFvSUSEwjaj0b+/bx5dzcMjx1H7RKpen8Vs6loq5B1xnm+FNPnOuAJ5m
         Bn2q5/qCL2HxWrPYdeTUQ+E4TUauSpKuwlD3/Xth44M2hlR2j5WSLZ3YqTApJFR8Yg
         mL5M6TyBdax002cSbGiwHZ6JR1fEJ5SArvMa3mWB8S1K1uVPBzEb86niC9WNRVuMPn
         UiXQBSAWAgCYw==
Received: by mail-ed1-f70.google.com with SMTP id c11-20020a056402120b00b0040321cea9d4so291978edw.23
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 23:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BnlFRfnEyWAxe1fw6gmGyUXzbXb/Exxy2EiruYyTAbQ=;
        b=7zHs8USD36X+UtnaVfDibA+GrLK1ob/WeGVF/zvrQ6kT+QnvmJcJZH63E0AYXbZMsy
         8HtqSz6zjlDZYjC8/oCDJRzf2CvY4r4Pemn1OJVTMwVxJl1xcym1wOQZ6xOnjuHjzFgx
         zdRMyteDJHQstYLwG9N2FqzS4KXuJAk7TsVgnqTnbaHR+FISLnxcTWur/YO/WY/RUIY4
         dhJgSMRhByzycE+pEDj/XGNGecj2pYnjLNCa8zZebwukA7tDhgrA6o81JsyntI7mwccT
         2uWc5thAXT+oYRjMpynS0/oB3vJ5NS4wStsJEPX9ilSRALClXjQ0K/PmHUP+rpR2Defk
         WoNg==
X-Gm-Message-State: AOAM533LIkWGmaxVfuNaR+N8KhXnSqF1en8hho+fsJKfIX+zg08WqdFw
        7ydEGtlb9BfixkA5g1c28LsFo52A8zRELOEmBRI5PuG2qdQoMh7w9p0f5EqJNE3CPnDkpfNncFm
        C6LuHL2d4qN8H/w6/9KVzYwpI1m+ON7Q5y9JtNGo=
X-Received: by 2002:a05:6402:50d3:: with SMTP id h19mr5266033edb.346.1642405536683;
        Sun, 16 Jan 2022 23:45:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMuqDcqMplgNTykVRmag/eEAnjZ76C8iPXMJNJiJNejm5c5xQel4/ESmkmvuy3yxY7PGuFQA==
X-Received: by 2002:a05:6402:50d3:: with SMTP id h19mr5266017edb.346.1642405536552;
        Sun, 16 Jan 2022 23:45:36 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id hp14sm4151387ejc.97.2022.01.16.23.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 23:45:36 -0800 (PST)
Message-ID: <77bd8fa4-2b35-352c-da07-ef91fcbed454@canonical.com>
Date:   Mon, 17 Jan 2022 08:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 24/28] dt-bindings: pinctrl: samsung: convert to
 dtschema
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
 <20220111201722.327219-18-krzysztof.kozlowski@canonical.com>
 <CACRpkdYTXSOW+sOX3wVtF4jj6xm0jr-F3HKQPGHOdAVjbasP3A@mail.gmail.com>
 <5047da7c-d3a6-5472-b0ca-7ed3dbe8a5fe@canonical.com>
 <CACRpkdbhmJ91EW395C5F2WYjWJQdJ-SBHaDm7XnQsxMuyoMmLg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CACRpkdbhmJ91EW395C5F2WYjWJQdJ-SBHaDm7XnQsxMuyoMmLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/01/2022 22:38, Linus Walleij wrote:
> On Sun, Jan 16, 2022 at 6:10 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> 
>> Anyway DTS and dtschema will have to wait for one release, because they
>> depend on samsung pinctrl driver change (patch #2).
> 
> What about I put that (and maybe this schema) on an immutable
> branch so you can pull the commit into your for-arm-soc branch and
> put the DTS changes on top?

That would be a solution if not a policy for arm-soc of keeping DTS
separate. Arnd and Olof since some time are not happy when DTS branch
receives any driver updates.

Arnd, Olof,
This is a set of dtschema conversion + DTS alignment with new schema:
1. Driver change necessary to accept new DTS (driver depends on node
names and this has to change because of dtschema),
2. DTS commits depending on above, which convert node name to new format,
3. Finally dtschema requiring new naming of the GPIO nodes.

If I got correctly, the policy of not mixing drivers and DTS requires
that #2 above (DTS changes) will wait for one more release. During the
time, if dtschema (#3 above) is applied, there will be new warnings
about non-compliant DTS.

Do you see any chance of merging driver + DTS + dtschema via same tree
in same release?


Best regards,
Krzysztof
