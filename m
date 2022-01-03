Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB957482FFD
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 11:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbiACKnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 05:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56861 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231356AbiACKnH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 05:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641206586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a47+iynTZYHfdTT0zB9zc41rMIGsXMimCVuHu9qpnFA=;
        b=WB9unT3PON3fpEzgn6SORbsZk1+goba70wplGKgzWdq4G0puCuNiamS0ZtQKH7dZ0VNZAA
        tJYvzdHauWB+XKyXrszHyla4glwD80XBV47KEf4OQ/mBO2zFUjTXXN3qaj5JMNA/rbRej5
        Np+O0TXjf6yONschN465XdYJUOxbTTk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-R9YHTd7MPjymU2CqRhayFw-1; Mon, 03 Jan 2022 05:43:02 -0500
X-MC-Unique: R9YHTd7MPjymU2CqRhayFw-1
Received: by mail-ed1-f69.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso22513563edt.20
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 02:43:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=a47+iynTZYHfdTT0zB9zc41rMIGsXMimCVuHu9qpnFA=;
        b=XPnzBtRd1yFXcx48WVH9kFjobQfEB3ebIWNAT/nG4XiSolMHOpTAD8p9OVKCXj6dhh
         /bfptXXHDneg3YePYkfycLTNwL3DkfgGWbF0AtPAD6j35GEoQRzVMglQtFq4/tg38jvV
         uPT/VGbk7+BTqUq3UXMUyKcSUvfGQLxEt5CMUQ0Jixy2h9kYuuvEqpjdXI01DXvqWf+W
         +YAnl/oGue7QRBRAy35Z4Fw6XOudGLuALUXaV/8v5czebNWq1/pE6KuZz1dncpRuuhvO
         2fL8twUR9Usq/rtBUkqYP2YqcX54S6m0i/Q4tzwxk1iogJM0homyOdOKJyMTHXDdWQOu
         ee+A==
X-Gm-Message-State: AOAM533us/Pv47zFUcpSWkVoY5SwBUdnDgEJTn8vGhmbm4/yjzd9bImc
        YqoKFcZPYV4UCJ6Cd/vLt6vxdN+cylD/rOkmRSKE4HxJMSCO2oXObQnXeAWZraqWbfaQ4wuTBMJ
        pCm5GNdAcwHpgJtXgTDhJog==
X-Received: by 2002:a17:906:af69:: with SMTP id os9mr37796441ejb.656.1641206581482;
        Mon, 03 Jan 2022 02:43:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxCCW6rD7FNB4l+OgaHdGvlAYiQHJ9rTCCWlOk8juZ88RZPyzecTcLvAOnoYrpA/3TOpuEOA==
X-Received: by 2002:a17:906:af69:: with SMTP id os9mr37796434ejb.656.1641206581264;
        Mon, 03 Jan 2022 02:43:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id j11sm13431344edv.0.2022.01.03.02.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 02:43:00 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------d0uqq962k5wEodQhDlpovCA1"
Message-ID: <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
Date:   Mon, 3 Jan 2022 11:42:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------d0uqq962k5wEodQhDlpovCA1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jarkko,

On 1/3/22 10:42, Jarkko Nikula wrote:
> Hi
> 
> We have a Braswell based preproduction HW. I noticed linux-next tag next-20211224 doesn't boot on it due to following error:
> 
> [   34.674271] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   34.682476] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   34.690681] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> ...
> 
> Linux v5.16-rc8 is ok. I found the following commit to be reason for the regression:
> 
> bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused")

Thank you for the timely headsup about this.

I assume that you have tried a revert (if necessary including reverting some
of the follow ups) and that reverting the patch you point to fixes the
issue, right ?

Can you try the 2 attached patches *one at a time* ? :

1. Restores the old behavior of just triggering hwirq 0 of
the pincontroller-domain when we don't know the mapping

2. Restores the old behavior which allows chv_gpio_irq_startup()
to overwrite the interrupt-line to pin mapping if the current
mapping points to pin 0

Both of these restore old behavior caused by a mapping-table
entry containing 0 meaning both unset as well as HWIRQ0
before the patch in question.

If applying them one at a time does not help, please also try with
both applied.

These 2 patches should apply cleanly on top of linux-next.

If patch 2 fixes things it would be interesting if you can grab a
dmesg with "pinctrl-cherryview.dyndbg" added to the command line
(with the patched kernel).

Regards,

Hans

--------------d0uqq962k5wEodQhDlpovCA1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-pinctrl-cherryview-Trigger-hwirq0-for-interrupt-line.patch"
Content-Disposition: attachment;
 filename*0="0001-pinctrl-cherryview-Trigger-hwirq0-for-interrupt-line.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0NmFiYTBmNDIzYjg5MGE4ZWUyMWM3NmI1ZDQ2MGQ4YmE1YzIwNWY4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDMgSmFuIDIwMjIgMTE6MTY6MDAgKzAxMDAKU3ViamVjdDogW1BB
VENIIDEvMl0gcGluY3RybDogY2hlcnJ5dmlldzogVHJpZ2dlciBod2lycTAgZm9yIGludGVy
cnVwdC1saW5lcwogd2l0aG91dCBhIG1hcHBpbmcKCkNvbW1pdCBiZGZiZWYyZDI5ZGMgKCJw
aW5jdHJsOiBjaGVycnl2aWV3OiBEb24ndCB1c2Ugc2VsZWN0aW9uIDAgdG8gbWFyawphbiBp
bnRlcnJ1cHQgbGluZSBhcyB1bnVzZWQiKSBtYWRlIHRoZSBjb2RlIHByb3Blcmx5IGRpZmZl
cmVudGlhdGUKYmV0d2VlbiB1bnNldCB2cyAoaHdpcnEpIDAgZW50cmllcyBpbiB0aGUgR1BJ
Ty1jb250cm9sbGVyIGludGVycnVwdC1saW5lCnRvIEdQSU8gcGlubnVtYmVyL2h3aXJxIG1h
cHBpbmcuCgpUaGlzIGlzIGNhdXNpbmcgc29tZSBib2FyZHMgdG8gbm90IGJvb3QuIFRoaXMg
Y29tbWl0IHJlc3RvcmVzIHRoZSBvbGQKYmVoYXZpb3Igb2YgdHJpZ2dlcmluZyBod2lycSAw
IHdoZW4gcmVjZWl2aW5nIGFuIGludGVycnVwdCBvbiBhbgppbnRlcnJ1cHQtbGluZSBmb3Ig
d2hpY2ggdGhlcmUgaXMgbm8gbWFwcGluZy4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9waW5jdHJsL2ludGVsL3Bp
bmN0cmwtY2hlcnJ5dmlldy5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
aW50ZWwvcGluY3RybC1jaGVycnl2aWV3LmMgYi9kcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGlu
Y3RybC1jaGVycnl2aWV3LmMKaW5kZXggYWJmZmRhMWZkNTFlLi4xZDU4MTgyNjkwNzYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJsLWNoZXJyeXZpZXcuYwor
KysgYi9kcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1jaGVycnl2aWV3LmMKQEAgLTE0
NzEsOCArMTQ3MSw5IEBAIHN0YXRpYyB2b2lkIGNodl9ncGlvX2lycV9oYW5kbGVyKHN0cnVj
dCBpcnFfZGVzYyAqZGVzYykKIAogCQlvZmZzZXQgPSBjY3R4LT5pbnRyX2xpbmVzW2ludHJf
bGluZV07CiAJCWlmIChvZmZzZXQgPT0gQ0hWX0lOVkFMSURfSFdJUlEpIHsKLQkJCWRldl9l
cnIoZGV2LCAiaW50ZXJydXB0IG9uIHVudXNlZCBpbnRlcnJ1cHQgbGluZSAldVxuIiwgaW50
cl9saW5lKTsKLQkJCWNvbnRpbnVlOworCQkJZGV2X3dhcm5fb25jZShkZXYsICJpbnRlcnJ1
cHQgb24gdW5tYXBwZWQgaW50ZXJydXB0IGxpbmUgJXVcbiIsIGludHJfbGluZSk7CisJCQkv
KiBTb21lIGJvYXJkcyBleHBlY3QgaHdpcnEgMCB0byB0cmlnZ2VyIGluIHRoaXMgY2FzZSAq
LworCQkJb2Zmc2V0ID0gMDsKIAkJfQogCiAJCWdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEo
Z2MtPmlycS5kb21haW4sIG9mZnNldCk7Ci0tIAoyLjMzLjEKCg==
--------------d0uqq962k5wEodQhDlpovCA1
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-pinctrl-cherryview-Allow-overwriting-the-interrupt-m.patch"
Content-Disposition: attachment;
 filename*0="0002-pinctrl-cherryview-Allow-overwriting-the-interrupt-m.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmODU4YWRkNTIxODVkOTI3ZGI1NDZjODA2NmYyOWI1NDVkMzdiM2JhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDMgSmFuIDIwMjIgMTE6MjI6MjggKzAxMDAKU3ViamVjdDogW1BB
VENIIDIvMl0gcGluY3RybDogY2hlcnJ5dmlldzogQWxsb3cgb3ZlcndyaXRpbmcgdGhlIGlu
dGVycnVwdAogbWFwcGluZyB3aGVuIGl0IHBvaW50cyB0byBwaW4gMAoKQ29tbWl0IGJkZmJl
ZjJkMjlkYyAoInBpbmN0cmw6IGNoZXJyeXZpZXc6IERvbid0IHVzZSBzZWxlY3Rpb24gMCB0
byBtYXJrCmFuIGludGVycnVwdCBsaW5lIGFzIHVudXNlZCIpIG1hZGUgdGhlIGNvZGUgcHJv
cGVybHkgZGlmZmVyZW50aWF0ZQpiZXR3ZWVuIHVuc2V0IHZzIChod2lycSkgMCBlbnRyaWVz
IGluIHRoZSBHUElPLWNvbnRyb2xsZXIgaW50ZXJydXB0LWxpbmUKdG8gR1BJTyBwaW5udW1i
ZXIvaHdpcnEgbWFwcGluZy4KClRoaXMgaXMgY2F1c2luZyBzb21lIGJvYXJkcyB0byBub3Qg
Ym9vdC4gVGhpcyBjb21taXQgcmVzdG9yZXMgdGhlIG9sZApiZWhhdmlvciBvZiBhbGxvd2lu
ZyBjaHZfZ3Bpb19pcnFfc3RhcnR1cCgpIHRvIG92ZXJ3cml0ZSB0aGUgaW50ZXJydXB0LWxp
bmUKdG8gcGluIG1hcHBpbmcgaWYgdGhlIGN1cnJlbnQgbWFwcGluZyBwb2ludHMgdG8gcGlu
IDAgKHdoaWNoIHVzZWQgdG8gYmUKaW50ZXJwcmV0ZWQgYXMgYm90aCAwIGFuZCB1bnVzZWQg
YmVmb3JlKS4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+Ci0tLQogZHJpdmVycy9waW5jdHJsL2ludGVsL3BpbmN0cmwtY2hlcnJ5dmlldy5j
IHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1jaGVycnl2
aWV3LmMgYi9kcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1jaGVycnl2aWV3LmMKaW5k
ZXggMWQ1ODE4MjY5MDc2Li5kZDIzYzc0MDVlMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGlu
Y3RybC9pbnRlbC9waW5jdHJsLWNoZXJyeXZpZXcuYworKysgYi9kcml2ZXJzL3BpbmN0cmwv
aW50ZWwvcGluY3RybC1jaGVycnl2aWV3LmMKQEAgLTEzMjIsNyArMTMyMiw4IEBAIHN0YXRp
YyB1bnNpZ25lZCBjaHZfZ3Bpb19pcnFfc3RhcnR1cChzdHJ1Y3QgaXJxX2RhdGEgKmQpCiAJ
CWVsc2UKIAkJCWhhbmRsZXIgPSBoYW5kbGVfZWRnZV9pcnE7CiAKLQkJaWYgKGNjdHgtPmlu
dHJfbGluZXNbaW50c2VsXSA9PSBDSFZfSU5WQUxJRF9IV0lSUSkgeworCQlpZiAoY2N0eC0+
aW50cl9saW5lc1tpbnRzZWxdID09IENIVl9JTlZBTElEX0hXSVJRIHx8CisJCSAgICBjY3R4
LT5pbnRyX2xpbmVzW2ludHNlbF0gPT0gMCkgewogCQkJaXJxX3NldF9oYW5kbGVyX2xvY2tl
ZChkLCBoYW5kbGVyKTsKIAkJCWRldl9kYmcoZGV2LCAidXNpbmcgaW50ZXJydXB0IGxpbmUg
JXUgZm9yIElSUV9UWVBFX05PTkUgb24gcGluICV1XG4iLAogCQkJCWludHNlbCwgcGluKTsK
LS0gCjIuMzMuMQoK
--------------d0uqq962k5wEodQhDlpovCA1--

