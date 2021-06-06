Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633D139CC86
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jun 2021 05:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhFFDg4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 23:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhFFDgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Jun 2021 23:36:55 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2741C061766;
        Sat,  5 Jun 2021 20:35:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id k22-20020a17090aef16b0290163512accedso6909048pjz.0;
        Sat, 05 Jun 2021 20:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R1yXdu8JZ1eDZs8wdjM58y8u04yCy+aSIlK6xQmrfZY=;
        b=CDo5uzDlJV3I84YsQSFDpvMJanMSRFYWt0rMz9Uzhu83K8Jqj3d/uLUSKjZCvfty+H
         BvWgpjk97CQ0Ww06i6gdAbM255G9ca309NIx5LF37+i7U3gEl9RsLFMRfAHSHObSAR6s
         JhASI7o82VxkUWv5L/gxhVK2g9n9h8T9SG5WxtDGimlfw4ve6Sx2tyQ38HG2iZk9Cqxi
         0dY1GkAcUv8Ze91HL13B3vDbQ7NN2yA5zphANqAR0r3CcMFQNA/Yuq0QNhuul7yogKMW
         QxOPS3em20o3y1RVO0lPORRGfvU6+f80nnER+rbEL1lOP0lNstau0i2P8SGkLc9aA7VL
         Uo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R1yXdu8JZ1eDZs8wdjM58y8u04yCy+aSIlK6xQmrfZY=;
        b=WGT8DC3HsUQeOx8XJSVSLXddg0NDgbCg+GFFk/J6Ac7Xs8i198uFV0OH6vaWZ/lhzh
         GloIxnzC60+d+8RDLK8TT6ewNgOz/IhH5Sv++HMzYozckAZtzvZ1dtrv0uUR7WnucDQT
         y+kOAf3ctJLu+mCiQrwvZDJlzX/PUknfyZ/D2Mks7qTM3Fazwkf4btHr3ca3OTkrBHDb
         Qu4J10eF9x2Kq/L04oeOdysPW2jro0XnYFabJoVDBmPdiJxz5+sLWEFRpVgRHh7o8p4s
         QELFwJMww1zqcEqETsa8W1AxJ+VxF6hVEIiilaJ3aZ4IaRmosI4vKzs7FQ5O8wVjl/Xe
         153w==
X-Gm-Message-State: AOAM530cRrEb3xDCOJ2pnxmMR7QIrxuUY9bvR0Xlajvi3wv21QQL9DDB
        x3hc8sCg/66K81JTDnBclJI=
X-Google-Smtp-Source: ABdhPJxmX6oiBCA7VN2COXdQXGnnh1E1L8affjLBjUVUDXHnfgdwIG7yjHyIiHZURtq91POr1l4x9Q==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id h13mr13570752pjc.20.1622950506113;
        Sat, 05 Jun 2021 20:35:06 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s9sm4865731pfm.120.2021.06.05.20.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 20:35:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] pinctrl: bcm: Constify static pinctrl_ops
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
 <20210605185908.39982-2-rikard.falkeborn@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4c198d42-20d9-47f0-78a4-fc45995e43e4@gmail.com>
Date:   Sat, 5 Jun 2021 20:35:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210605185908.39982-2-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/5/2021 11:59 AM, Rikard Falkeborn wrote:
> These are only assigned, either directly or via the bcm63xx_pinctrl_soc
> struct, to the pctlops field in the pinctrl_desc struct and never
> modified, so make them const to allow the compiler to put them in
> read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
