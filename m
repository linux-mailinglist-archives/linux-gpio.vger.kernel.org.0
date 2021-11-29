Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AC9460C7B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 02:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbhK2CAC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 21:00:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbhK2B6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 20:58:02 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D50BC061574;
        Sun, 28 Nov 2021 17:54:45 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id m17so12995999qvx.8;
        Sun, 28 Nov 2021 17:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7MaKgHWKheFJxrj1uWy9VXOHQvwGLYHTJJDUwnT5qBg=;
        b=Nw8U4Nh1acnHpjcd3TP0eUKlOTKgUcZahWOSyhCAb3yHOlEdJ17O2gO6qgdEKwTa6Q
         gSsLL1gEzdyFYBknHxFyuzLyDvRMao53dpLtZuhVNSTzHr/aZRJpNNcEkRU4B/TI4IB1
         JXVCvtR5DEXpm90y13qPNGMZdDQdyhF3Pbmq495t+xRBOsk7TwUfC9tvV6xL1IUVrsxB
         D5ExKlsAsKUPMlx5PdLDg3vzEJC6M6pPdPA4HRp33AQM2ZiXHE9/WW9WKbxLs5cgrFsP
         2uwQ5CMiRz4jHw3LuGRXLXqwvn8S6JQESz2pVvtGz+BV4bGsvo8l76tXEUq2LcNJ5bfo
         bYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7MaKgHWKheFJxrj1uWy9VXOHQvwGLYHTJJDUwnT5qBg=;
        b=Mxz7xlpfTO8GAM/iPOPEknTZt6Wj0VLAXBqE0QXlsd7tEpAJdH3Ol4IH8HVUccMIEb
         o3rxR0RfHd1/IDq3qmBdRUviC9cruzAVjKtsiy91orvsnx88DZ4aCM/a8HgVPG5+Kj9a
         FIpfgU3oU0EbQGdzON6pQmw/2UbkaZdUsMVGj66s9X9EBQhriwu30ueb0TPRcwJXMNg4
         wajEERcrT7YiWs/0SoAJMZihSl4m+oSvmI5ie+Kv4/z3pS8XtBMfyVgHwpjzI3XdxbPR
         U/XuTFKyolLNIUgcXMwyFk3PzODa89TvLyYPNNTLuDoiuiZdD+E9FJMcjc1eSEcGB3dg
         JCug==
X-Gm-Message-State: AOAM533kstJMbwnfZIrL35etIueD/nNn2pxgvdZX/kSsd+kqxq3Y5Ijq
        rCfkl0vuiuMgd5iDXvvBhH0=
X-Google-Smtp-Source: ABdhPJy8P5wGLR5qlwlUnmOoPab1PnL6Y6pKQU9VYozKNDseX9QhhAKbzXifVxoKlDW/T2V8qG2A8g==
X-Received: by 2002:ad4:5ba7:: with SMTP id 7mr28358496qvq.109.1638150884300;
        Sun, 28 Nov 2021 17:54:44 -0800 (PST)
Received: from [10.4.10.5] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j19sm7580997qkp.28.2021.11.28.17.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 17:54:44 -0800 (PST)
Message-ID: <f65ac2c7-3f37-3740-fd7a-4d11cabb9892@gmail.com>
Date:   Sun, 28 Nov 2021 20:54:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 13/13] ARM: imxrt_defconfig: add i.MXRT family
 defconfig
Content-Language: en-US
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-14-Mr.Bossman075@gmail.com>
 <95252a9e-76fc-0770-8e7b-90d8755298eb@benettiengineering.com>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <95252a9e-76fc-0770-8e7b-90d8755298eb@benettiengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/28/21 20:21, Giulio Benetti wrote:
> Hi Jesse,
> 
> On 25/11/21 22:14, Jesse Taube wrote:
>> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> Add generic i.MXRT family defconfig.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>> V1->V2:
>> * Nothing done
>> V2->V3:
>> * Nothing done
>> ---
>>    arch/arm/configs/imxrt_defconfig | 157 +++++++++++++++++++++++++++++++
>>    1 file changed, 157 insertions(+)
>>    create mode 100644 arch/arm/configs/imxrt_defconfig
>>
>> diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
>> new file mode 100644
>> index 000000000000..d673745a5462
>> --- /dev/null
>> +++ b/arch/arm/configs/imxrt_defconfig
>> @@ -0,0 +1,157 @@
>> +# CONFIG_LOCALVERSION_AUTO is not set
>> +CONFIG_SYSVIPC=y
>> +CONFIG_USELIB=y
>> +CONFIG_NO_HZ=y
>> +CONFIG_HIGH_RES_TIMERS=y
>> +CONFIG_BPF_SYSCALL=y
>> +CONFIG_PREEMPT_VOLUNTARY=y
>> +CONFIG_BSD_PROCESS_ACCT=y
>> +CONFIG_BSD_PROCESS_ACCT_V3=y
>> +CONFIG_PSI=y
>> +CONFIG_IKCONFIG=y
>> +CONFIG_IKCONFIG_PROC=y
>> +CONFIG_LOG_BUF_SHIFT=18
>> +CONFIG_MEMCG=y
>> +CONFIG_BLK_CGROUP=y
>> +CONFIG_CFS_BANDWIDTH=y
>> +CONFIG_CGROUP_PIDS=y
>> +CONFIG_CGROUP_RDMA=y
>> +CONFIG_CGROUP_FREEZER=y
>> +CONFIG_CGROUP_DEVICE=y
>> +CONFIG_CGROUP_CPUACCT=y
>> +CONFIG_CGROUP_PERF=y
>> +CONFIG_CGROUP_BPF=y
>> +CONFIG_NAMESPACES=y
>> +CONFIG_USER_NS=y
>> +CONFIG_CHECKPOINT_RESTORE=y
>> +CONFIG_SCHED_AUTOGROUP=y
>> +CONFIG_RELAY=y
>> +CONFIG_BLK_DEV_INITRD=y
>> +CONFIG_EXPERT=y
>> +CONFIG_SGETMASK_SYSCALL=y
>> +# CONFIG_FUTEX is not set
>> +CONFIG_KALLSYMS_ALL=y
>> +CONFIG_PC104=y
>> +# CONFIG_SLUB_DEBUG is not set
>> +# CONFIG_COMPAT_BRK is not set
>> +CONFIG_SLAB_FREELIST_RANDOM=y
>> +CONFIG_SLAB_FREELIST_HARDENED=y
>> +CONFIG_PROFILING=y
>> +# CONFIG_MMU is not set
>> +CONFIG_ARCH_MXC=y
>> +CONFIG_SOC_IMXRT=y
>> +# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
>> +CONFIG_SET_MEM_PARAM=y
>> +CONFIG_DRAM_BASE=0x80000000
>> +CONFIG_DRAM_SIZE=0x02000000
> 
> While debugging I've found that both CONFIG_DRAM_* get their default
> value because CONFIG_SET_MEM_PARAM is not enabled. This can work but
> leads problems while debugging and in any case those 2 options are
> ignored. So please add on top of them:
> CONFIG_SET_MEM_PARAM=y
> 
oops i accidentally deleted that thx, im confused as to how it still 
worked...
> Thank you
> 
