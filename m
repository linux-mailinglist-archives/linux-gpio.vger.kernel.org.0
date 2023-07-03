Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1107455E3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 09:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjGCHWT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 03:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjGCHWR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 03:22:17 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F173AF
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 00:22:16 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b88e84bfb8so9886855ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2023 00:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688368936; x=1690960936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+THK0n+VGuu+4v8xQoXUWrkoYjgA2i10r9vr2UfC7Q=;
        b=JyGQhwTiF2vl3wUVVzPnaE5Dv4qemczGIKB3V8yhJrDnZKYYE8jUq00GXC35TCaefK
         LZVWlyUuQrydggT7+vLbM2R8KixlNobL29PdGoLF8ZA1y1I9kgo/I63a0WaKj/7OxE9t
         eQXwNStMvMHVU7dRF+pF5fduW20/pFz5QAjbUHm/miPbg8hm6gnWQGIjps7FWC0hmy2K
         YHItN2JEIH5Gil+p30aqrjEAVmItfoV+FLu1Az8ksSO+hNKXABLShu1c0fka8POZVbvb
         U8vopPsxEXVqi+3cg8K5xYtgBuw/arOnXXyVXH+ExiCkNdDOFel80JUA4cUHE0w8t343
         ovkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688368936; x=1690960936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+THK0n+VGuu+4v8xQoXUWrkoYjgA2i10r9vr2UfC7Q=;
        b=e9GNvep03fAdFFdPHDjtncsXxlhpbF4f9fAVE4DE8LIVoOFAhGnEes2Or5Xz4zmz3w
         nZS2grdP/SNCApy8dMK0YlE9Rl5ULn2W+7SDC+25qcfSvDCPRXxUv502WCgbuDFOgUdH
         pmZ3PZGP5Z1dQTCHOOLZ3/bbHqGqjI/1nBWsIJJP4eIJ92C6mxT1/r+MXOwJi/cZHKcZ
         zLys05siVjSjXIPXlkUdfbsiNguV+D+B36JIxGflYjT2lGVRfi9eFcPkNJDQ+r0p7+M5
         en48w/p9dw/oc0wSwqzkmFgGjL8NOnmS/eYzwWg0Qt+mc/WxxY06DLuIkE6Kg/HmxOaS
         V/FA==
X-Gm-Message-State: ABy/qLaXowb+KjncaK+7uq/C10lu/qDLHTy8L2cZM+vkjDScio6EhLFF
        Fudwn3bzvDgZHWkByxHGf94L6es2Vn4H5VgVsdQ=
X-Google-Smtp-Source: APBJJlG9TDm9jiPGoV25wgsvTCW2Ylry/821lfzDRHvEac1okD15vW1GqPob02WmqnqIi0SRsQdGhA==
X-Received: by 2002:a17:902:e5c1:b0:1b8:6cac:ffe8 with SMTP id u1-20020a170902e5c100b001b86cacffe8mr12127853plf.51.1688368935911;
        Mon, 03 Jul 2023 00:22:15 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001b8052d58a0sm12165120plb.305.2023.07.03.00.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 00:22:15 -0700 (PDT)
Date:   Mon, 3 Jul 2023 12:52:13 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH v2 0/2] bindings: rust: add README for crates.io
Message-ID: <20230703072213.jd73kmflbp2jvywv@vireshk-i7>
References: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-07-23, 09:19, Erik Schilling wrote:
> The READMEs are displayed on crates.io for published crates. This tries
> to provide a little more context there.
> 
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
