Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 053DC4D91E3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 02:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344080AbiCOBC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 21:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344078AbiCOBC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 21:02:28 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3000744751
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:01:18 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id e186so34287892ybc.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gwzntja23CXu4nGypeSr/YvTugWSt8x1I0iZeIrduiw=;
        b=w/1wPl5nG6eMDlh7Z0yU3HXqeLwQ5QBWszqv5df0uqy1LxL3+rLlGYIRK+WzT0GIH8
         Mq1jlON/2+qWJTWVpnLnPoW6TjFdpB+gpxHiFud/0k+BEvaLFtB40YWONxyJDsgZxap7
         +LPnW26Ve7/T6IKr7x/jcoqX+IAhYpP6W4PvyhqZb0v7oVg4L32LzW2+b4triLeX5/Jq
         KLSSpWyENZ/1/w/KMSXxpVmA/pj0c0VJUOv4TYwKADmyfx6MtiO26K8c8TlolQPOYCJ+
         gshgl8Zsx9fUk/1LgCXo3Df055vqnFe15EftZTWRrGyXj8VhWCWI7Fi6aYuvRVEIVFjg
         W5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gwzntja23CXu4nGypeSr/YvTugWSt8x1I0iZeIrduiw=;
        b=Sz9PyuqbzMi058Z8c0etgaq0IK7vphlhuPe/Ll0ht1nH2So/ZqcXaDl5fnb3jWiIWO
         zWXyj93Yx4a3zxLhtueOaHqXfN3W9tdSy5HnwXC9JrB6WZYK75xep0S4XHYPjw4d5JGw
         50Dybm8WT8Lx0eymg4Hlz6sUajBYsb5m3hgyIiXbc/CDSzN0ToHPfYIx3WiBRXoMxFcA
         Se6hhsnemH7n/aA6Ii4YXm+tl2lGs65hDXPIxLOrQrdnLrHcfZtxvb2aOUdIWvt/GUkt
         Ri3AT14feRuazb7O+WiM+rlhHDY4GMFfMF8Ij6SDD+Kzz2JOUdMd0qgsGObh67TNBH1Y
         O3Hg==
X-Gm-Message-State: AOAM530n4usYIZV6su7jqBW8v5VUHutyCkKrPyfg5jQNq7cf8+on1k1n
        PNHpf7MG7sK8iMzX/OMuiyz60nh7Fg6Ppj78R2vpOg==
X-Google-Smtp-Source: ABdhPJxu4gmQuoPTkL8MiSyXdebzsRdwsuGk37SWTmhlwfgJWlYUbSuxcacb8hStJKAfGOje6uvJr+q5hilUnnsniEk=
X-Received: by 2002:a05:6902:203:b0:628:7b6f:2845 with SMTP id
 j3-20020a056902020300b006287b6f2845mr21223883ybs.533.1647306077478; Mon, 14
 Mar 2022 18:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
In-Reply-To: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 02:01:06 +0100
Message-ID: <CACRpkdbDWrrDPK9=5NErtM81109qtTHyFcTON=zXtB2B86wAdA@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch with 5.17-rc1 + "pinctrl: baytrail:
 Add pinconf,group + function for the pmu_clk"
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 24, 2022 at 5:48 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Hello Intel pinctrl maintainers,
>
> As discussed here is a pull-req for an immutable branch with 5.17-rc1 +
> "pinctrl: baytrail: Add pinconf,group + function for the pmu_clk".

I suppose this is for Andy possibly I already pulled the pulled tree.

Yours,
Linus Walleij
