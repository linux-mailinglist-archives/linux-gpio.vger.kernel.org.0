Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A447B5F3D44
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 09:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiJDHan (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 03:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiJDHaj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:30:39 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B0831EDC
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:30:35 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id qx23so8878775ejb.11
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yPfd3Jwd9rlaL0Pne53MMVojSqXI9G05BY139YmW+lk=;
        b=Ca4p3uuK71y+eMmACG00B8GkRIUI9jZUFqlyDeLV8jaWRAJnQzm8vnhB2KlJDXv6Ri
         9lqUAtjFTMUMEjqcDtUcHApGx8J2e4DtMk5MZZKVzKXLsb3lIq01JIRWx3kkpG1GStnt
         En56mIQXr4H+A9nuRF0iZC29egex4as+iA+1DanYegxUihLSjhbArn8w4WHdz1f5H3T5
         puCFpZuTA2h+J2HS75ko05iA5tSz0X24AhKnXb7Tpgq0WejCwsn+dt80hn081GgxyIig
         /0Sgtt5BZFtHHVdOOwqsI7tMvUNzV00zChCKe32uO5wNc5Hx/480fpBkeQniuGKYYlxu
         METQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yPfd3Jwd9rlaL0Pne53MMVojSqXI9G05BY139YmW+lk=;
        b=XvbFRCmSOvfvYnUzoyTSGqG3y4F+eJK73te66Uka049De8gBQaKtJGJUK41bnczZzF
         pjRalRoJYuRSCqT2xuzDOAwCBikXP1mek28YwP127hg5GNOcy1OQ9HaoMbTsMJaAYCcP
         jdtuAFkNPZDvBg5nEQVZZKjcd7DQHbHdUCHdlu/a+MghEewWMICZve76zWHv0vntrTRD
         itJUAoqH/ySqVMv5bM+XVzYQG3Tob+TJ18xQwfd9zPCl3jbUh+MWug4FL9uQtxzWe1VM
         mQJ/NDllM1xOB03ojCZD1h0Ow+SucXcGXiwzuiLDLy0311Zg2tgYpq/eIjvvDhx5Ozy3
         Pyug==
X-Gm-Message-State: ACrzQf2R2X1LOmvdgH3jNqtXfT3Qet/8xhjdew1YE6JCjFlwCS6V8aO5
        K1F9kbOdCexbflmG17LUrzv+n6k1pascnloxhGOROw==
X-Google-Smtp-Source: AMsMyM5lxTKIiElB5NO4KnhFjeWLDqHWiPV1kLQ1/5osb1K2FqLqDKVPFtHD7xbKcQ4tqTBREj+wL8LDG64rem6vxP4=
X-Received: by 2002:a17:907:2d0b:b0:782:76dc:e557 with SMTP id
 gs11-20020a1709072d0b00b0078276dce557mr17303700ejc.690.1664868634318; Tue, 04
 Oct 2022 00:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220926061259.13491-1-shubhrajyoti.datta@amd.com> <20220926061259.13491-3-shubhrajyoti.datta@amd.com>
In-Reply-To: <20220926061259.13491-3-shubhrajyoti.datta@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 09:30:23 +0200
Message-ID: <CACRpkdbOvALG=LLK3QdSwscgBeTsK-dtay75DNKpdqaAAm1MAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: pca9570: add a platform data structure
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-gpio@vger.kernel.org, git@amd.com,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, brgl@bgdev.pl
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 26, 2022 at 8:14 AM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:

> Add struct pca9570_platform_data for adding the platform data
> structure. Also modify the existing structs for pca9570 and pca9571
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

This looks nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
