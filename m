Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273A67BAA1C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 21:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjJET0y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 15:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjJET0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 15:26:47 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0B6DB
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 12:26:46 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c60128d3f6so34815ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696534006; x=1697138806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5wvhBkE/Y4VMn6AJO1ol9tVQweOIpEQMTvvNcvIVBY=;
        b=VpeP3XpYRBUhP2PNH3VDcpNwDG136vJMY9EmmZBr4hf42CA688xxwZvUl6ZgW/WTj9
         OXimihdzx67TX2naullczltfyL9pSdm7MRpTsJC9H16mUgd3hYhhKV0scjNWASmVnvzJ
         EX0b/bZSNDz8pG8ajQsPLoCNC+XGs/+Fa4/yoZ9iPMjh5NS/+jppr+qvMAZ/blfcsf0R
         4YgBcFe5gF6g29WJyUSdAUpf8cKx0NwAcvU4RdpDyWcXdrxPQm49k1dza1nLfV+oi8uM
         UYZ3p9vD8QyJUVHJnL4GKBmIWREVxty2TuMxNQI0JRE74GtOk2W9IbQkzeBfAjC6GRYu
         qgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696534006; x=1697138806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5wvhBkE/Y4VMn6AJO1ol9tVQweOIpEQMTvvNcvIVBY=;
        b=HeBCh0NAlznFY976vSslD3U4td+fxt3mbluW+nXXIjuaEDRTmH52Qt1k137CbLQSTn
         ZVAphrfFIiINql1aJiEYujBgFKhf892rOo/D8GwfFtdlZqTIRcZdLlklOgDjOZpERXVI
         AO6Xie6r1cKzDdqJeL/Fo8DYGOk+H6RbDBrIDX+QdgGVg8vzz/RYIKMaGQ3XeNB83xwJ
         PV7DlwIbNLiJXWihCAh/F7c50FivEHul9/dlgdv28b0pf1vt35jF1dyyc0ED+nvTJPS8
         MElS/KXy6Vci6B9JuDrahBH+lyUkqESdzlAwKy25fc8KjaKjLLvp8+aw4UWAsPj0h4TB
         1x/w==
X-Gm-Message-State: AOJu0YxWsPDalhDok+Qq5i/beYur8u2nUmQl+iK6BhFdGhjbytcV2X6A
        NvTfHy/GwCZAjXhay/FhlfFXTA==
X-Google-Smtp-Source: AGHT+IEvlW5ijXe/2pcrast4aYhuAkaqOVIKwMflwNG+XXHh2gpdTvxD9kb2uTNW+B8NtUSf9Nq2Xw==
X-Received: by 2002:a17:902:f54b:b0:1c5:6691:4931 with SMTP id h11-20020a170902f54b00b001c566914931mr179417plf.12.1696534005954;
        Thu, 05 Oct 2023 12:26:45 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id i11-20020a17090332cb00b001bfd92ec592sm2097592plr.292.2023.10.05.12.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 12:26:45 -0700 (PDT)
Date:   Thu, 5 Oct 2023 12:26:42 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        gregkh@linuxfoundation.org, kernel-team@android.com
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Message-ID: <ZR8N8rxnYOgPXHJK@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com>
 <db02684f-c32b-4e09-8752-8d07dcb518c3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db02684f-c32b-4e09-8752-8d07dcb518c3@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/05/2023, Krzysztof Kozlowski wrote:
> On 05/10/2023 19:59, William McVicker wrote:
> > On 10/05/2023, Peter Griffin wrote:
> >> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> >> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> >> phones. It features:
> >> * 4xA55 little cluster
> >> * 2xA76 Mid cluster
> >> * 2xX1 Big cluster
> >>
> >> This commit adds the basic device tree for gs101 (SoC) and oriole
> >> (pixel 6). Further platform support will be added over time.
> >>
> >> It has been tested with a minimal busybox initramfs and boots to
> >> a shell.
> >>
> 
> William,
> 
> Please do not Cc non-existing mailboxes. You added Cc kernel-team and we
> all got awesome bounces now:
> 
> "We're writing to let you know that the group you tried to contact
> (kernel-team) may not exist, or you may not have permission to post
> messages to the group. A few more details on why you weren't able to post:"
> 
> Best regards,
> Krzysztof
> 

Sorry, I mistyped the email. Should have been kernel-team@android.com.

Regards,
Will
