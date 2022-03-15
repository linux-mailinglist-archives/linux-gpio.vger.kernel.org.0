Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3CD4D9778
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 10:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346388AbiCOJTe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 05:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346505AbiCOJTd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 05:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB73D12748
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647335899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MHO3i7cDL4QgzAYf1pciKR2WcoM9oO/OIWe2fzf8iIU=;
        b=L1vpU0d4g7HnW0Suz1FzS1Qm3tVi0/S5Af8jiPlV3YDiwimjQGsRAVblZ3GXS139iEn8BY
        EHhCSkRdMtksNgHsHAXpe48jqjG7C1q7I5T910/lQyhjx4fRNgAU3F02tHiMRzJ6lQgBy6
        AN3+RD6N98rhYAMnWZDiQFvmQCwOFaE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-7HkK-lTMNHWF7sfylEKXYw-1; Tue, 15 Mar 2022 05:18:17 -0400
X-MC-Unique: 7HkK-lTMNHWF7sfylEKXYw-1
Received: by mail-ej1-f70.google.com with SMTP id le4-20020a170907170400b006dab546bc40so9313449ejc.15
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 02:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MHO3i7cDL4QgzAYf1pciKR2WcoM9oO/OIWe2fzf8iIU=;
        b=5qXcJqg/TZG2Px0n7r78lNw/LS5jLOob4DpYpq4hjRy7B1LYnJUdXUHNLaVD4nKRCL
         2SQcsL4LVR8CimcEAVPk25Lf+aU4+pHNC3isAnEu0hQUwr/pf+GW3bGYp2jRQtNypfaL
         ZVZtQ62FlDK5bIX+3vAvm1zKXgA4jscDYY/ucNxdU42nPfwiJJWaoR2qlFhC4hKXS6OK
         Nvqu0tr67myU555j8Uv3V3t4X/Zfjuuaq66EWRMR5AV57CC9ojQT1kU/gnyalBf1ud0U
         IZqiPJG5k6NGaBOObZq7rqokowZMkvrA4QBsP/FZtH9m3+U6Gid3Ouw6GtZFyjJtGRLQ
         NXCA==
X-Gm-Message-State: AOAM533y9wBXy/ewx5BsMAHM1mW3l3J/Zo1XK3k9P1rMnCCCdha6vxai
        4iUFOk7VSEGMrBYIAcQjjIr9A/xVNP7nPtbsOeConwmNsfIY58w3q9Cn21e372XppzH3CwUiZYT
        RiOUzX6lh8FFbUsfqAkb/cA==
X-Received: by 2002:a17:907:961b:b0:6d9:acb0:5403 with SMTP id gb27-20020a170907961b00b006d9acb05403mr21664815ejc.568.1647335896157;
        Tue, 15 Mar 2022 02:18:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4v41/A9xo5XXNPP80pes2Ha5409yxGlxlGhhRyWxa+fvDuDAIERk1zhjYVJLIhEsfb4YdzA==
X-Received: by 2002:a17:907:961b:b0:6d9:acb0:5403 with SMTP id gb27-20020a170907961b00b006d9acb05403mr21664803ejc.568.1647335895929;
        Tue, 15 Mar 2022 02:18:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id uz4-20020a170907118400b006dab1ea6e3asm7828556ejb.51.2022.03.15.02.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 02:18:15 -0700 (PDT)
Message-ID: <aab9d25e-f6f9-b831-769b-ab95cd1bea74@redhat.com>
Date:   Tue, 15 Mar 2022 10:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [GIT PULL] Immutable branch with 5.17-rc1 + "pinctrl: baytrail:
 Add pinconf,group + function for the pmu_clk"
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
 <CACRpkdbDWrrDPK9=5NErtM81109qtTHyFcTON=zXtB2B86wAdA@mail.gmail.com>
 <CAHp75Ve9s+hEjhWwdjbRJhEU-Efno_TyAUH+D7iRrE8enivvtg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve9s+hEjhWwdjbRJhEU-Efno_TyAUH+D7iRrE8enivvtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 3/15/22 07:19, Andy Shevchenko wrote:
> On Tue, Mar 15, 2022 at 3:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Feb 24, 2022 at 5:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> Hello Intel pinctrl maintainers,
>>>
>>> As discussed here is a pull-req for an immutable branch with 5.17-rc1 +
>>> "pinctrl: baytrail: Add pinconf,group + function for the pmu_clk".
>>
>> I suppose this is for Andy possibly I already pulled the pulled tree.
> 
> Nope, but it appears not necessary. We have nothing to update in my
> tree which is dependent on this PR.

Ok, note this is already in the platform-drivers-x86 tree, since this
was a dep for another patch there. So I guess the single patch in the PR
will find its way upstream through the pdx86 tree then (which is fine).

Regards,

Hans

