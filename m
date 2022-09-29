Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA9E5EF62F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 15:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbiI2NOQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 09:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbiI2NOD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 09:14:03 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E119186991
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 06:13:51 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s10so1502887ljp.5
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=tIW2HbJiOlBSdP6fVAORaxjH/uYMGCngHaITXFjh1vE=;
        b=Mf+Okd6WOcouI7/GLNto4+11PukX3NTzw46mNRoQKaSG9bZDUUg0nYnfPHye0uRQq/
         EXjca5eNhY1HJWqAsF3atEz7tgzue8zcdmseUZMKzlzZCx4OtJ6QglAufo/bxtEOx/al
         Pq4yn4xbNAPxSSDrhMgVa2hgdaddmlGrqlNNXmKNcpYLyD2eHE4ShWtLKzLVpkR0ZzJT
         y1dAWdnUGDUKGumyb+r4m8n0MRfXj0NexwUYLYqOf5AxMVvDqabFZypXaRTTLzDDAtEG
         EjlUFmJnne1Y3j79RsBtt0JAg/ws8Fuo2Bg8yUGgWcTmwH/GQHjCd5g0JVu6wYcb8zoH
         +PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=tIW2HbJiOlBSdP6fVAORaxjH/uYMGCngHaITXFjh1vE=;
        b=ObganSdGSUonDbxbJhQusOYb2MOPY6lMG2bC4KgUuoZ/qtuC3YmPEVsMinanllGmhZ
         nd+ARoYCNyGku5BC7qCq4VEuy0lmZ290pEaqj8Zxdu3y9YT7yNoY2S7A+cSJJVQv9j6N
         A+mZoJcS8z/sfpXA6PELdwJWtXnFtGXxDmJqss0xFALd4fNeVErhRFpteCaSHlinN+Ug
         iw5ps3lQruWOSkB2+b5kC2+pe1Q3hUjh4FG1f63jkCaYehmztSxW59Z+Zf1N5xEpQIu5
         8RJ0Sxu46YsJ45G2mzJ/vfT006OwAM02ghgDn3zlO2MbLCUD/PXtoasogf70MuJQWn1a
         6N9w==
X-Gm-Message-State: ACrzQf0D2rDA+g35bZlz+mZcxQDHXAvuQvKKmGJ2FCUz7GEKBRORi8Qb
        W3UeM/dFUfn+zHO30NIrKVMQtSmadGdWKSih+reMyRqrtuI=
X-Google-Smtp-Source: AMsMyM6sUd3EvaUJKpWxq3rGBTaW6DhnmHipQ24N6hivRKn/HgV6inr85BkrbKJRf5xk0Fbg+E6CKdLztJIe7GVu4JU=
X-Received: by 2002:a2e:a7cf:0:b0:26c:541a:e04c with SMTP id
 x15-20020a2ea7cf000000b0026c541ae04cmr1126067ljp.425.1664457228549; Thu, 29
 Sep 2022 06:13:48 -0700 (PDT)
MIME-Version: 1.0
From:   Mark Locascio <maldata@gmail.com>
Date:   Thu, 29 Sep 2022 08:13:36 -0500
Message-ID: <CA+8QDpKHEm6UZBRUSsuo+K62MROLcLRqbOZnB9D6qionsD5j5Q@mail.gmail.com>
Subject: [libgpiod] Either a bug or a misunderstanding regarding bulk operations
To:     linux-gpio@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000da537c05e9d0a5af"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--000000000000da537c05e9d0a5af
Content-Type: text/plain; charset="UTF-8"

  Hi,

I was working with libgpiod and I noticed some unintuitive behavior. I
can't say for sure that it's a bug, but at the very least, it's
confusing, and I want to get clarification. Sample code is attached.

Let's say I have four lines that I want to use as outputs. I can
request them all at once like this:

struct gpiod_chip* chip = gpiod_chip_open("/dev/gpiochip0");
struct gpiod_line_bulk lines;
uint32_t offsets[NUMOUTPUTS] = {6, 13, 19, 26};
int get_lines_result = gpiod_chip_get_lines(chip, offsets, NUMOUTPUTS, &lines);
int32_t values[NUMOUTPUTS] = {0, 0, 0, 0};
int set_dir_result = gpiod_line_request_bulk_output(&lines, "testgpio", values);

And then when I want to set new values, I can update the "values"
array and then do:

int set_result = gpiod_line_set_value_bulk(&lines, values);

This works exactly as expected. However, I need to maintain an array
of the current values of all the output lines. If I didn't want to do
that, perhaps because I was wrapping this in a function, I thought it
could make sense to get a single line object from the bulk object, and
then just set that one value. For example:

void set_line_high(struct gpiod_line_bulk* all_lines, int line_index)
{
    struct gpiod_line* single_line =
gpiod_line_bulk_get_line(&all_lines, line_index);
    int set_result = gpiod_line_set_value(single_line, 1);
}

This only works for line_index == 0. A more illuminating test case is
to have a loop that iterates over all of my outputs and toggles them
all every second:

while (keep_going)
{
    for (int i = 0; i < NUMOUTPUTS  ; i++)
    {
        values[i] = counter % 2;

        struct gpiod_line* single_line = gpiod_line_bulk_get_line(&lines, i);
        int set_result = gpiod_line_set_value(single_line, values[i]);
    }

    counter++;
    usleep(1000000);
}

When I run this, the first line in the bulk object is the only one
that toggles. The other three are always off. If I replace it with

for (int i = 0; i < NUMOUTPUTS; i++)
{
    values[i] = counter % 2;
}

int set_result = gpiod_line_set_value_bulk(&lines, values);
counter++;
usleep(1000000);

it works fine, and all lines toggle as expected. I have attached two
test programs that build & run on a raspberry pi (I just attached the
GPIOs to LEDs to see what's happening). One works, the other doesn't,
using the approaches above.

Is this expected behavior? I took a look at the code and didn't see an
immediate reason this wouldn't work. Let me know, and I'm happy to
help either troubleshoot or help update the docs to make it more clear
why this isn't intended to work.

Thanks!
-Mark

--000000000000da537c05e9d0a5af
Content-Type: text/plain; charset="US-ASCII"; name="test-working.c"
Content-Disposition: attachment; filename="test-working.c"
Content-Transfer-Encoding: base64
Content-ID: <f_l8n2uih41>
X-Attachment-Id: f_l8n2uih41

I2luY2x1ZGUgPGdwaW9kLmg+CiNpbmNsdWRlIDxlcnJvci5oPgojaW5jbHVkZSA8ZmNudGwuaD4g
IC8vIGZvciBvcGVuKCkKI2luY2x1ZGUgPGxpbnV4L3NwaS9zcGlkZXYuaD4gIC8vIGZvciBzdHJ1
Y3Qgc3BpX2lvY190cmFuc2ZlcgojaW5jbHVkZSA8c2lnbmFsLmg+ICAvLyBmb3Igc2lnbmFsIGhh
bmRsaW5nCiNpbmNsdWRlIDxzdGRpby5oPiAgLy8gZnByaW50ZiwgcHJpbnRmLCBzdGRlcnIKI2lu
Y2x1ZGUgPHN0cmluZy5oPiAgLy8gZm9yIG1lbXNldAojaW5jbHVkZSA8dW5pc3RkLmg+ICAvLyBm
b3IgY2xvc2UoKQojaW5jbHVkZSA8c3lzL2lvY3RsLmg+IC8vIGZvciBpb2N0bCgpCiNpbmNsdWRl
IDxzeXMvdGltZS5oPgojaW5jbHVkZSA8c3RkaW50Lmg+IC8vIGZvciB1aW50MzJfdAoKI2RlZmlu
ZSBOVU1PVVRQVVRTIDQKCnZvbGF0aWxlIGJvb2wga2VlcF9nb2luZzsKCnZvaWQgdGVybWluYXRp
b25faGFuZGxlcihpbnQgc2lnbnVtKQp7CiAgICBrZWVwX2dvaW5nID0gZmFsc2U7Cn0KCmludCBt
YWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCnsKICAgIHN0cnVjdCBzaWdhY3Rpb24gdGVybV9o
YW5kbGVyOwogICAgc3RydWN0IHNpZ2FjdGlvbiBwcmV2X2hhbmRsZXI7CgogICAgc3RydWN0IGdw
aW9kX2NoaXAqIGNoaXAgPSBOVUxMOwogICAgc3RydWN0IGdwaW9kX2xpbmVfYnVsayBsaW5lczsK
CiAgICB0ZXJtX2hhbmRsZXIuc2FfaGFuZGxlciA9IHRlcm1pbmF0aW9uX2hhbmRsZXI7CiAgICBz
aWdlbXB0eXNldCgmdGVybV9oYW5kbGVyLnNhX21hc2spOwogICAgdGVybV9oYW5kbGVyLnNhX2Zs
YWdzID0gMDsKICAgIHNpZ2FjdGlvbihTSUdJTlQsICZ0ZXJtX2hhbmRsZXIsICZwcmV2X2hhbmRs
ZXIpOwoKICAgIHByaW50ZigiU2V0dGluZyB1cCBHUElPLi4uXG4iKTsKCiAgICBjaGlwID0gZ3Bp
b2RfY2hpcF9vcGVuKCIvZGV2L2dwaW9jaGlwMCIpOwogICAgaWYgKCFjaGlwKQogICAgewogICAg
ICAgIHBlcnJvcigiZ3Bpb2RfY2hpcF9vcGVuIGZhaWxlZCIpOwogICAgICAgIHJldHVybiAxOwog
ICAgfQoKICAgIHVpbnQzMl90IG9mZnNldHNbTlVNT1VUUFVUU10gPSB7NiwgMTMsIDE5LCAyNn07
CiAgICBpbnQgZ2V0X2xpbmVzX3Jlc3VsdCA9IGdwaW9kX2NoaXBfZ2V0X2xpbmVzKGNoaXAsIG9m
ZnNldHMsIE5VTU9VVFBVVFMsICZsaW5lcyk7CiAgICBpZiAoZ2V0X2xpbmVzX3Jlc3VsdCAhPSAw
KQogICAgewogICAgICAgIHBlcnJvcigiZ3Bpb2RfY2hpcF9nZXRfbGluZXMgZmFpbGVkIik7CiAg
ICAgICAgcmV0dXJuIDE7CiAgICB9CgogICAgaW50MzJfdCB2YWx1ZXNbTlVNT1VUUFVUU10gPSB7
MCwgMCwgMCwgMH07CiAgICBpbnQgc2V0X2Rpcl9yZXN1bHQgPSBncGlvZF9saW5lX3JlcXVlc3Rf
YnVsa19vdXRwdXQoJmxpbmVzLCAidGVzdGdwaW8iLCB2YWx1ZXMpOwogICAgaWYgKHNldF9kaXJf
cmVzdWx0ICE9IDApCiAgICB7CiAgICAgICAgcHJpbnRmKCJncGlvZF9saW5lX3JlcXVlc3Rfb3V0
cHV0KCkgZmFpbGVkXG4iKTsKICAgICAgICByZXR1cm4gMTsKICAgIH0KCiAgICBrZWVwX2dvaW5n
ID0gdHJ1ZTsKICAgIGludCBjb3VudGVyID0gMDsKICAgIHdoaWxlIChrZWVwX2dvaW5nKQogICAg
ewogICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgTlVNT1VUUFVUUzsgaSsrKQogICAgICAgIHsK
ICAgICAgICAgICAgdmFsdWVzW2ldID0gY291bnRlciAlIDI7CiAgICAgICAgfQoKICAgICAgICBp
bnQgc2V0X3Jlc3VsdCA9IGdwaW9kX2xpbmVfc2V0X3ZhbHVlX2J1bGsoJmxpbmVzLCB2YWx1ZXMp
OwogICAgICAgIGlmIChzZXRfcmVzdWx0ICE9IDApCiAgICAgICAgewogICAgICAgICAgICBwcmlu
dGYoImdwaW9kX2xpbmVfc2V0X3ZhbHVlKCkgZmFpbGVkIVxuIik7CiAgICAgICAgICAgIGtlZXBf
Z29pbmcgPSBmYWxzZTsKICAgICAgICB9CgogICAgICAgIGNvdW50ZXIrKzsKICAgICAgICB1c2xl
ZXAoMTAwMDAwMCk7CiAgICB9CgogICAgcHJpbnRmKCJTdG9wcGluZy5cbiIpOwoKICAgIGdwaW9k
X2xpbmVfcmVsZWFzZV9idWxrKCZsaW5lcyk7CiAgICBncGlvZF9jaGlwX2Nsb3NlKGNoaXApOwoK
ICAgIHByaW50ZigiU3RvcHBlZC5cbiIpOwoKICAgIHJldHVybiAwOwp9Cg==
--000000000000da537c05e9d0a5af
Content-Type: text/plain; charset="US-ASCII"; name="test-not-working.c"
Content-Disposition: attachment; filename="test-not-working.c"
Content-Transfer-Encoding: base64
Content-ID: <f_l8n2uifq0>
X-Attachment-Id: f_l8n2uifq0

I2luY2x1ZGUgPGdwaW9kLmg+CiNpbmNsdWRlIDxlcnJvci5oPgojaW5jbHVkZSA8ZmNudGwuaD4g
IC8vIGZvciBvcGVuKCkKI2luY2x1ZGUgPGxpbnV4L3NwaS9zcGlkZXYuaD4gIC8vIGZvciBzdHJ1
Y3Qgc3BpX2lvY190cmFuc2ZlcgojaW5jbHVkZSA8c2lnbmFsLmg+ICAvLyBmb3Igc2lnbmFsIGhh
bmRsaW5nCiNpbmNsdWRlIDxzdGRpby5oPiAgLy8gZnByaW50ZiwgcHJpbnRmLCBzdGRlcnIKI2lu
Y2x1ZGUgPHN0cmluZy5oPiAgLy8gZm9yIG1lbXNldAojaW5jbHVkZSA8dW5pc3RkLmg+ICAvLyBm
b3IgY2xvc2UoKQojaW5jbHVkZSA8c3lzL2lvY3RsLmg+IC8vIGZvciBpb2N0bCgpCiNpbmNsdWRl
IDxzeXMvdGltZS5oPgojaW5jbHVkZSA8c3RkaW50Lmg+IC8vIGZvciB1aW50MzJfdAoKI2RlZmlu
ZSBOVU1PVVRQVVRTIDQKCnZvbGF0aWxlIGJvb2wga2VlcF9nb2luZzsKCnZvaWQgdGVybWluYXRp
b25faGFuZGxlcihpbnQgc2lnbnVtKQp7CiAgICBrZWVwX2dvaW5nID0gZmFsc2U7Cn0KCmludCBt
YWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCnsKICAgIHN0cnVjdCBzaWdhY3Rpb24gdGVybV9o
YW5kbGVyOwogICAgc3RydWN0IHNpZ2FjdGlvbiBwcmV2X2hhbmRsZXI7CgogICAgc3RydWN0IGdw
aW9kX2NoaXAqIGNoaXAgPSBOVUxMOwogICAgc3RydWN0IGdwaW9kX2xpbmVfYnVsayBsaW5lczsK
CiAgICB0ZXJtX2hhbmRsZXIuc2FfaGFuZGxlciA9IHRlcm1pbmF0aW9uX2hhbmRsZXI7CiAgICBz
aWdlbXB0eXNldCgmdGVybV9oYW5kbGVyLnNhX21hc2spOwogICAgdGVybV9oYW5kbGVyLnNhX2Zs
YWdzID0gMDsKICAgIHNpZ2FjdGlvbihTSUdJTlQsICZ0ZXJtX2hhbmRsZXIsICZwcmV2X2hhbmRs
ZXIpOwoKICAgIHByaW50ZigiU2V0dGluZyB1cCBHUElPLi4uXG4iKTsKCiAgICBjaGlwID0gZ3Bp
b2RfY2hpcF9vcGVuKCIvZGV2L2dwaW9jaGlwMCIpOwogICAgaWYgKCFjaGlwKQogICAgewogICAg
ICAgIHBlcnJvcigiZ3Bpb2RfY2hpcF9vcGVuIGZhaWxlZCIpOwogICAgICAgIHJldHVybiAxOwog
ICAgfQoKICAgIHVpbnQzMl90IG9mZnNldHNbTlVNT1VUUFVUU10gPSB7NiwgMTMsIDE5LCAyNn07
CiAgICBpbnQgZ2V0X2xpbmVzX3Jlc3VsdCA9IGdwaW9kX2NoaXBfZ2V0X2xpbmVzKGNoaXAsIG9m
ZnNldHMsIE5VTU9VVFBVVFMsICZsaW5lcyk7CiAgICBpZiAoZ2V0X2xpbmVzX3Jlc3VsdCAhPSAw
KQogICAgewogICAgICAgIHBlcnJvcigiZ3Bpb2RfY2hpcF9nZXRfbGluZXMgZmFpbGVkIik7CiAg
ICAgICAgcmV0dXJuIDE7CiAgICB9CgogICAgaW50MzJfdCB2YWx1ZXNbTlVNT1VUUFVUU10gPSB7
MCwgMCwgMCwgMH07CiAgICBpbnQgc2V0X2Rpcl9yZXN1bHQgPSBncGlvZF9saW5lX3JlcXVlc3Rf
YnVsa19vdXRwdXQoJmxpbmVzLCAidGVzdGdwaW8iLCB2YWx1ZXMpOwogICAgaWYgKHNldF9kaXJf
cmVzdWx0ICE9IDApCiAgICB7CiAgICAgICAgcHJpbnRmKCJncGlvZF9saW5lX3JlcXVlc3Rfb3V0
cHV0KCkgZmFpbGVkXG4iKTsKICAgICAgICByZXR1cm4gMTsKICAgIH0KCiAgICBrZWVwX2dvaW5n
ID0gdHJ1ZTsKICAgIGludCBjb3VudGVyID0gMDsKICAgIHdoaWxlIChrZWVwX2dvaW5nKQogICAg
ewogICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgTlVNT1VUUFVUUzsgaSsrKQogICAgICAgIHsK
ICAgICAgICAgICAgdmFsdWVzW2ldID0gY291bnRlciAlIDI7CgogICAgICAgICAgICBzdHJ1Y3Qg
Z3Bpb2RfbGluZSogc2luZ2xlX2xpbmUgPSBncGlvZF9saW5lX2J1bGtfZ2V0X2xpbmUoJmxpbmVz
LCBpKTsKICAgICAgICAgICAgaW50IHNldF9yZXN1bHQgPSBncGlvZF9saW5lX3NldF92YWx1ZShz
aW5nbGVfbGluZSwgdmFsdWVzW2ldKTsKICAgICAgICAgICAgaWYgKHNldF9yZXN1bHQgIT0gMCkK
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgcHJpbnRmKCJncGlvZF9saW5lX3NldF92YWx1
ZSgpIGZhaWxlZCFcbiIpOwogICAgICAgICAgICAgICAga2VlcF9nb2luZyA9IGZhbHNlOwogICAg
ICAgICAgICB9CiAgICAgICAgfQoKICAgICAgICBjb3VudGVyKys7CiAgICAgICAgdXNsZWVwKDEw
MDAwMDApOwogICAgfQoKICAgIHByaW50ZigiU3RvcHBpbmcuXG4iKTsKCiAgICBncGlvZF9saW5l
X3JlbGVhc2VfYnVsaygmbGluZXMpOwogICAgZ3Bpb2RfY2hpcF9jbG9zZShjaGlwKTsKCiAgICBw
cmludGYoIlN0b3BwZWQuXG4iKTsKCiAgICByZXR1cm4gMDsKfQo=
--000000000000da537c05e9d0a5af--
