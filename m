Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428A46E926B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 13:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbjDTL0F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 07:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234162AbjDTLZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 07:25:49 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634FD93E1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 04:24:53 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-2f917585b26so504343f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681989891; x=1684581891;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FuoX729rDdl3nw02UCfodQKJLmZU6xSJTMIz+3yGVs=;
        b=HJiA6uR7S/tVU/VgjhCsZacuUfDbF7mZjX15IEZm7XPb0cSdU6Vvv8tmNQu0hNleD+
         y3QyWZPC3xEnMMJFcQ/1JFePsNs4UuqaLOSrR2jvcanYtB7JRHUkG6MoS307Zpc+N9Cv
         MxwPVwm5wLFOvCpg5Hlb0syRBzit2NDsu7B1HBjG2CFKYx5gS0guDXBfFlKYr+Mz24DO
         G8gWDZ0nq6NObdUZ3e9E/FISpT8WzKRk/3ZFVo8du0QV3FpRI9+8EvesyP10j2mJe+Zs
         U606z/dAoXq8zdmfUOy9CLiA8YCD4DhYGKaF18AXQlyvjX1vrm55joBNpjAPjGGM8L18
         MMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681989891; x=1684581891;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FuoX729rDdl3nw02UCfodQKJLmZU6xSJTMIz+3yGVs=;
        b=RfKcnwymmO8cZwVkZ0FWwwaARpz08ZVn77f8vKeMbmhXajlSxgNlJ+jNycA0NEYjq8
         MU5veO/08NZ1ALadhvHgS7vWA9quObl5fP7tWBTPgTt+l48AI4zYT7S2B1t1lgmH6hLf
         0u8Rqq3KumN6L6BZRKIIJObRvhyTsuVo5AYs80MRWAKsxUwJoPZQJR1Sh1AXVhQ9AlbY
         4hlWAMynzmusIcGDZfLDatuCylfNj6VkmPeI/9Npnws2wVf6k5PC2E99YLUtdDo+AtTU
         VeoJgMrWZVyhfNkVopIt3SVcUn0gKttQ1l+t9Ml6L5gvjKoJz8hkIdQCwaxJGsQt5OrA
         wfUQ==
X-Gm-Message-State: AAQBX9c+P5ShliVHQbFzFK7SbsdDEookfxqV1P20bWkbDotBWAFDakrn
        YuoElY4fA7W/jdlLruwUZmHS9Q==
X-Google-Smtp-Source: AKy350b4BoRvjTWMo86AsVoLB8HUI3UU2/+kaHQKDmVwnky9AZ2YXR757tg/flZ1qhMGdrObFiVcUw==
X-Received: by 2002:a05:6000:1a53:b0:2cf:2dcc:3421 with SMTP id t19-20020a0560001a5300b002cf2dcc3421mr1101199wry.5.1681989891711;
        Thu, 20 Apr 2023 04:24:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g3-20020a5d5543000000b002fe254f6c33sm1694530wrw.92.2023.04.20.04.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 04:24:51 -0700 (PDT)
Date:   Thu, 20 Apr 2023 14:24:48 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     lakshmi.sai.krishna.potthuri@xilinx.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Message-ID: <9e0761f0-ffbc-41ea-aaaf-81d3306f34f6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Sai Krishna Potthuri,

The patch 8b242ca700f8: "pinctrl: Add Xilinx ZynqMP pinctrl driver
support" from Apr 22, 2021, leads to the following Smatch static
checker warning:

	drivers/pinctrl/pinctrl-zynqmp.c:681 zynqmp_pinctrl_create_pin_groups()
	warn: missing error code? 'ret'

drivers/pinctrl/pinctrl-zynqmp.c
    667 static int zynqmp_pinctrl_create_pin_groups(struct device *dev,
    668                                             struct zynqmp_pctrl_group *groups,
    669                                             unsigned int pin)
    670 {
    671         u16 resp[NUM_GROUPS_PER_RESP] = {0};
    672         int ret, i, index = 0;
    673 
    674         do {
    675                 ret = zynqmp_pinctrl_get_pin_groups(pin, index, resp);
    676                 if (ret)
    677                         return ret;
    678 
    679                 for (i = 0; i < NUM_GROUPS_PER_RESP; i++) {
    680                         if (resp[i] == NA_GROUP)
--> 681                                 return ret;

"ret" is zero at this point.  This looks intentional?  We loop until
we find a NA_GROUP then return zero?  Better to "return 0;" explicitly,
though.

    682 
    683                         if (resp[i] == RESERVED_GROUP)
    684                                 continue;
    685 
    686                         zynqmp_pinctrl_group_add_pin(&groups[resp[i]], pin);
    687                 }
    688                 index += NUM_GROUPS_PER_RESP;
    689         } while (index <= MAX_PIN_GROUPS);
    690 
    691         return 0;
    692 }

regards,
dan carpenter
